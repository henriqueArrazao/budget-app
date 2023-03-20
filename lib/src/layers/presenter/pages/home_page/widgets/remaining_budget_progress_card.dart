import 'package:flutter/material.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/defaults/default_formats.dart';

import '../../../../../core/defaults/default_colors.dart';
import '../../../../../core/defaults/default_spaces.dart';
import '../../../widgets/progress_widget.dart';

class RemainingBudgetProgressCard extends StatelessWidget {
  final double spentAmount;
  final double monthlyLimit;
  const RemainingBudgetProgressCard({
    super.key,
    required this.spentAmount,
    required this.monthlyLimit,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DefaultSpaces.m,
          vertical: DefaultSpaces.m,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _InfoColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    description: appLocalizations.spent,
                    value: spentAmount,
                  ),
                ),
                Expanded(
                  child: _InfoColumn(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    description: AppLocalizations.of(context)!.monthlyLimit,
                    value: monthlyLimit,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DefaultSpaces.m),
            ProgressWidget(fraction: (spentAmount / monthlyLimit)),
          ],
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String description;
  final double value;
  final CrossAxisAlignment crossAxisAlignment;
  const _InfoColumn({
    required this.description,
    required this.value,
    required this.crossAxisAlignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(description,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: DefaultColors.greyText)),
        FittedBox(
          child: Text(
            DefaultFormats.currency(value),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
