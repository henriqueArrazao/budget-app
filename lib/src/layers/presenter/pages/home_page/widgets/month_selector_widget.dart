import 'package:flutter/material.dart';
import 'package:sample_project/src/core/defaults/default_formats.dart';

class MonthSelectorWidget extends StatelessWidget {
  final VoidCallback onPrevMonthTap;
  final VoidCallback? onNextMonthTap;
  final DateTime monthDate;
  const MonthSelectorWidget({
    super.key,
    required this.onPrevMonthTap,
    required this.onNextMonthTap,
    required this.monthDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPrevMonthTap,
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        Text(
          DefaultFormats.monthAndYear(monthDate),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(
          onPressed: onNextMonthTap,
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}
