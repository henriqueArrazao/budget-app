import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/global_injections.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/defaults/default_formats.dart';
import 'package:sample_project/src/core/defaults/default_regex.dart';
import 'package:sample_project/src/core/defaults/default_spaces.dart';
import 'package:sample_project/src/core/defaults/default_validators.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/layers/data/repositories/transactions_repository.dart';
import 'package:sample_project/src/layers/presenter/dialogs/add_transaction_dialog/controller/add_transaction_controller.dart';
import 'package:sample_project/src/layers/presenter/widgets/error_snackbar.dart';

class AddTransactionDialog extends StatefulWidget {
  final DateTime selectedMonthDate;
  const AddTransactionDialog({
    required this.selectedMonthDate,
    super.key,
  });

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController descriptionInputController;
  late final TextEditingController amountInputController;
  late final AddTransactionController controller;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    descriptionInputController = TextEditingController();
    amountInputController = TextEditingController();
    controller = AddTransactionController(
      transactionsRepository: getIt<TransactionsRepository>(),
      monthDate: widget.selectedMonthDate,
    );
  }

  @override
  void dispose() {
    descriptionInputController.dispose();
    amountInputController.dispose();
    formKey.currentState?.dispose();
    controller.dispose();
    super.dispose();
  }

  void onSuccess(void _) => context.pop(true);
  void onFailure(BuildContext context, Failure? failure) =>
      ScaffoldMessenger.of(context).showSnackBar(ErrorSnackbar(
        message: failure?.message,
        context: context,
      ));

  Future<DateTime?> pickDate({
    required BuildContext context,
    required DateTime currDate,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    DateTime lastDate = DateTime(today.year, today.month + 1, 0);
    if (lastDate.isAfter(today)) lastDate = today;

    return showDatePicker(
      context: context,
      initialDate: currDate,
      firstDate: DateTime(currDate.year, currDate.month, 1),
      lastDate: lastDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizatinos = AppLocalizations.of(context)!;
    return ListenableProvider.value(
      value: controller,
      builder: (context, child) {
        return AlertDialog(
          title: Text(appLocalizatinos.addTransaction),
          content: SingleChildScrollView(
            child: Form(
              onWillPop: () => SynchronousFuture(!controller.value.isLoading),
              key: formKey,
              child: Selector(
                  selector: (context, AddTransactionController controller) =>
                      controller.value.isLoading,
                  builder: (context, isLoading, child) {
                    if (isLoading) {
                      return Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        TextFormField(
                          controller: descriptionInputController,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            labelText: appLocalizatinos.description,
                            counter: const SizedBox.shrink(),
                          ),
                          maxLength: 50,
                        ),
                        const SizedBox(height: DefaultSpaces.m),
                        TextFormField(
                          controller: amountInputController,
                          textInputAction: TextInputAction.done,
                          validator: DefaultValidators.dollarValidator(
                            appLocalizations: appLocalizatinos,
                            acceptNegative: true,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixText:
                                '${NumberFormat.simpleCurrency().currencySymbol} ',
                            labelText: '${appLocalizatinos.amount} *',
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(DefaultRegexes
                                .positiveAndNegativeDoubleForInput),
                          ],
                        ),
                        const SizedBox(height: DefaultSpaces.l),
                        Selector(
                          builder: (context, DateTime currDate, child) {
                            return TextButton(
                              onPressed: () => pickDate(
                                context: context,
                                currDate: currDate,
                              ).then(
                                (pickedDate) {
                                  if (pickedDate != null) {
                                    context
                                        .read<AddTransactionController>()
                                        .setDate(pickedDate);
                                  }
                                },
                              ),
                              child: Row(children: [
                                const Icon(Icons.calendar_month),
                                const SizedBox(width: DefaultSpaces.m),
                                Text(DefaultFormats.day(currDate)),
                              ]),
                            );
                          },
                          selector:
                              (context, AddTransactionController controller) =>
                                  controller.value.date,
                        ),
                      ],
                    );
                  }),
            ),
          ),
          actions: [
            Selector(
              selector: (context, AddTransactionController controller) =>
                  controller.value.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) return const SizedBox.shrink();
                return Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(appLocalizatinos.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          final description =
                              descriptionInputController.text.trim();
                          final amount =
                              double.parse(amountInputController.text);

                          final dialogController =
                              context.read<AddTransactionController>();
                          dialogController
                              .submit(description: description, amount: amount)
                              .then(
                                (result) => result.fold(
                                  (failure) => onFailure(context, failure),
                                  onSuccess,
                                ),
                              );
                        }
                      },
                      child: Text(appLocalizatinos.add),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
