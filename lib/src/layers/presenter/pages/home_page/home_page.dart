import 'package:flutter/material.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/global_injections.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/navigation/route_paths.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/global_config_controller.dart';
import 'package:sample_project/src/layers/data/repositories/transactions_repository.dart';
import 'package:sample_project/src/layers/presenter/widgets/error_snackbar.dart';

import '../../../../core/defaults/default_spaces.dart';
import '../../widgets/sliver_sized_box.dart';
import 'controller/month_transactions_controller.dart';
import 'widgets/balance_header_widget.dart';
import 'widgets/month_selector_widget.dart';
import 'widgets/month_slide_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MonthTransactionsController controller;

  @override
  void initState() {
    super.initState();
    controller = MonthTransactionsController(
        transactionsRepository: getIt<TransactionsRepository>());
    controller.loadMonthTransactions();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return ListenableProvider.value(
      value: controller,
      builder: (context, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(appLocalizations.monthlyBudget),
                pinned: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      context.push(RoutePaths.config);
                    },
                  ),
                ],
              ),
              SliverSizedBox(height: DefaultSpaces.l),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: DefaultSpaces.l),
                  child: Column(
                    children: [
                      Selector(
                        builder: (context, balance, child) {
                          return BalanceHeaderWidget(balance: balance);
                        },
                        selector: (context, GlobalConfigController controller) {
                          return controller.value.config!.balance;
                        },
                      ),
                      const SizedBox(height: DefaultSpaces.m),
                      Selector(
                          builder: (context, monthDate, child) {
                            return MonthSelectorWidget(
                              onPrevMonthTap: controller.goToPreviousMonth,
                              onNextMonthTap:
                                  controller.value.isNextMonthBtnEnabled
                                      ? controller.goToNextMonth
                                      : null,
                              monthDate: controller.value.monthDate,
                            );
                          },
                          selector: (context,
                                  MonthTransactionsController controller) =>
                              controller.value.monthDate),
                    ],
                  ),
                ),
              ),
              SliverSizedBox(height: DefaultSpaces.m),
              Selector(
                builder: (context, transactionsState, child) {
                  return MonthSlideWidget(
                    transactionsState: transactionsState,
                  );
                },
                selector: (context, MonthTransactionsController controller) =>
                    controller.value.transactionsState,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context
                  .push(RoutePaths.addTransaction(
                      monthDate: controller.value.monthDate))
                  .then((value) {
                if (value == true) {
                  controller.loadMonthTransactions();
                  final configController =
                      context.read<GlobalConfigController>();
                  configController.loadData(force: true).then((result) {
                    result.fold(
                        (failure) => ScaffoldMessenger.of(context).showSnackBar(
                              ErrorSnackbar(
                                context: context,
                                message: failure.message ??
                                    appLocalizations.failedToLoadBalance,
                              ),
                            ),
                        (config) => null);
                  });
                }
              });
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
