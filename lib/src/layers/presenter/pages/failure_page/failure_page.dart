import 'package:flutter/material.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';

class BootstrapFailurePage extends StatelessWidget {
  final String routePathToGo;
  const BootstrapFailurePage({
    super.key,
    required this.routePathToGo,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(appLocalizations.somethingWentWrong),
            ElevatedButton(
              onPressed: () {
                context.go(routePathToGo);
              },
              child: Text(appLocalizations.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
