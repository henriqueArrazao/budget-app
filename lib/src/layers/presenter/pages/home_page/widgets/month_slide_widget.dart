import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/global_config_controller.dart';
import 'package:sample_project/src/layers/presenter/pages/home_page/controller/month_transactions_controller.dart';
import 'package:sample_project/src/layers/presenter/pages/home_page/widgets/transaction_tile.dart';
import 'package:sample_project/src/layers/presenter/widgets/error_snackbar.dart';
import 'package:sample_project/src/layers/presenter/widgets/sliver_sized_box.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../core/defaults/default_spaces.dart';
import '../controller/transactions_state.dart';
import 'remaining_budget_progress_card.dart';

class MonthSlideWidget extends StatefulWidget {
  final TransactionsState transactionsState;
  const MonthSlideWidget({
    required this.transactionsState,
    super.key,
  });

  @override
  State<MonthSlideWidget> createState() => _MonthSlideWidgetState();
}

class _MonthSlideWidgetState extends State<MonthSlideWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: DefaultSpaces.l),
      sliver: widget.transactionsState.when(
        error: (message) => SliverFillRemaining(
          hasScrollBody: false,
          child: SliverToBoxAdapter(
            child: Text(message ?? appLocalizations.somethingWentWrong),
          ),
        ),
        loading: () => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        loaded: (transactions, spentAmount) {
          return MultiSliver(
            children: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Selector(
                      builder: (context, monthlyLimit, child) {
                        return RemainingBudgetProgressCard(
                          spentAmount: spentAmount,
                          monthlyLimit: monthlyLimit,
                        );
                      },
                      selector: (context, GlobalConfigController controller) {
                        return controller.value.config!.monthlyLimit;
                      },
                    ),
                  ],
                ),
              ),
              if (transactions.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(appLocalizations.noTransactionsSoFar),
                  ),
                )
              else ...[
                SliverSizedBox(height: DefaultSpaces.xl),
                SliverToBoxAdapter(
                  child: Text(
                    appLocalizations.transactions,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SliverSizedBox(height: DefaultSpaces.xs),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final transaction = transactions[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: DefaultSpaces.xs,
                        ),
                        child: TransactionTile(
                          transaction: transaction,
                          onDelete: () async {
                            final controller =
                                context.read<MonthTransactionsController>();

                            final result =
                                await controller.deleteTransaction(transaction);
                            result.fold(
                              (failure) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                ErrorSnackbar(
                                  context: context,
                                  message: failure.message,
                                ),
                              ),
                              (_) {
                                final configController =
                                    context.read<GlobalConfigController>();
                                configController.loadData(force: true);
                              },
                            );
                          },
                        ),
                      );
                    },
                    childCount: transactions.length,
                  ),
                ),
                SliverSizedBox(height: DefaultSpaces.l),
              ]
            ],
          );
        },
      ),
    );
  }
}
