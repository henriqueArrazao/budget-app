import 'package:go_router_flow/go_router_flow.dart';
import 'package:sample_project/global_injections.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/global_config_controller.dart';
import 'package:sample_project/src/layers/presenter/dialogs/add_transaction_dialog/add_transaction_dialog.dart';
import 'package:sample_project/src/layers/presenter/pages/failure_page/failure_page.dart';

import '../../layers/presenter/pages/config_page/config_page.dart';
import '../../layers/presenter/pages/home_page/home_page.dart';
import 'custom/dialog_page.dart';
import 'route_paths.dart';

final goRouterInstance = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      redirect: (context, state) async {
        final res = await getIt<GlobalConfigController>().loadData();
        return res.fold(
          (failure) => RoutePaths.failure,
          (config) => config != null ? RoutePaths.home : RoutePaths.config,
        );
      },
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RoutePaths.failure,
      builder: (context, state) =>
          const BootstrapFailurePage(routePathToGo: RoutePaths.home),
    ),
    GoRoute(
      path: RoutePaths.addTransactionDeclaration,
      pageBuilder: (context, state) {
        final year = state.params['year']!;
        final month = state.params['month']!;
        final selectedMonthDate = DateTime(int.parse(year), int.parse(month));
        return DialogPage(
          child: AddTransactionDialog(selectedMonthDate: selectedMonthDate),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.config,
      builder: (context, state) => const ConfigPage(),
    ),
  ],
);
