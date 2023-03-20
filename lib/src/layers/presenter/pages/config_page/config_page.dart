import 'package:flutter/material.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/global_injections.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/defaults/default_formats.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/core/navigation/route_paths.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/global_config_controller.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/interfaces/global_config_setter.dart';
import 'package:sample_project/src/layers/data/models/config_model.dart';
import 'package:sample_project/src/layers/data/repositories/config_repository.dart';
import 'package:sample_project/src/layers/presenter/pages/config_page/controller/config_page_controller.dart';
import 'package:sample_project/src/layers/presenter/widgets/error_snackbar.dart';

import '../../../../core/defaults/default_spaces.dart';
import 'widgets/config_info.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController currentBalanceInputController;
  late final TextEditingController monthlyInputController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    final config = getIt<GlobalConfigController>().value.config;
    currentBalanceInputController = TextEditingController(
      text:
          config != null ? DefaultFormats.currencyToInput(config.balance) : '',
    );
    monthlyInputController = TextEditingController(
      text: config != null
          ? DefaultFormats.currencyToInput(config.monthlyLimit)
          : '',
    );
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    currentBalanceInputController.dispose();
    monthlyInputController.dispose();
    super.dispose();
  }

  void onSuccess(void _) =>
      context.canPop() ? context.pop() : context.go(RoutePaths.home);
  void onFailure(Failure? failure) => ScaffoldMessenger.of(context)
      .showSnackBar(ErrorSnackbar(message: failure?.message, context: context));

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return ListenableProvider(
      create: (_) => ConfigPageController(
        configRepository: getIt<ConfigRepository>(),
        globalConfigSetter: getIt<GlobalConfigSetter>(),
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(appLocalizations.configureYourAccount),
            elevation: 0,
          ),
          body: Selector(
            selector: (_, ConfigPageController controller) =>
                controller.value.isLoading,
            builder: (context, isLoading, child) {
              return Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(DefaultSpaces.m),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ConfigInfoInputForm(
                                acceptNegative: true,
                                title: appLocalizations.currentBalance,
                                subtitle:
                                    appLocalizations.howMuchDoYouHaveRightNow,
                                controller: currentBalanceInputController,
                                autoFocus: true,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: DefaultSpaces.xl),
                              ConfigInfoInputForm(
                                acceptNegative: false,
                                title: appLocalizations.monthlyLimit,
                                subtitle:
                                    appLocalizations.howMuchYouCanSpendPerMonth,
                                controller: monthlyInputController,
                                textInputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
          persistentFooterButtons: [
            if (context.canPop())
              TextButton(
                onPressed: context.pop,
                child: Text(appLocalizations.cancel),
              ),
            TextButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  final balance =
                      double.parse(currentBalanceInputController.text);
                  final monthlyLimit =
                      double.parse(monthlyInputController.text);

                  final pageController = context.read<ConfigPageController>();
                  final res = await pageController.submit(
                    ConfigModel(balance: balance, monthlyLimit: monthlyLimit),
                  );
                  res.fold(onFailure, onSuccess);
                }
              },
              child: Text(context.canPop()
                  ? appLocalizations.save
                  : appLocalizations.continuee),
            ),
          ],
        );
      },
    );
  }
}
