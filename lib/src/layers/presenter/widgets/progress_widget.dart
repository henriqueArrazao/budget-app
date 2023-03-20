import 'package:flutter/material.dart';

import '../../../core/defaults/default_colors.dart';

class ProgressWidget extends StatelessWidget {
  final double fraction;
  const ProgressWidget({required this.fraction, super.key});

  static const progressBarKey = Key('progressBar');

  @override
  Widget build(BuildContext context) {
    final percent = (fraction.clamp(0, 1) * 100).round();
    return Container(
      height: 8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: DefaultColors.progressBackground,
      ),
      child: Row(
        children: [
          Expanded(
            flex: percent,
            child: Container(
              key: progressBarKey,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 100 - percent,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
