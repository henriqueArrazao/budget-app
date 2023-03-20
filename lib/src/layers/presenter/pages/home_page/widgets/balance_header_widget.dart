import 'package:flutter/material.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/defaults/default_formats.dart';

class BalanceHeaderWidget extends StatelessWidget {
  final double balance;
  const BalanceHeaderWidget({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          appLocalizations.currentBalance,
          style: const TextStyle(fontSize: 16),
        ),
        FittedBox(
          child: Text(
            DefaultFormats.currency(balance),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
