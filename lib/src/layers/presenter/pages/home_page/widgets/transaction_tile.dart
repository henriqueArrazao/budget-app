import 'package:flutter/material.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/defaults/default_colors.dart';
import 'package:sample_project/src/core/defaults/default_spaces.dart';
import 'package:sample_project/src/layers/data/models/transaction_model.dart';

import '../../../../../core/defaults/default_formats.dart';

class TransactionTile extends StatefulWidget {
  final TransactionModel transaction;
  final Future Function() onDelete;
  const TransactionTile({
    required this.transaction,
    required this.onDelete,
  });

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Card(
      elevation: 1,
      child: ListTile(
        title: Text(widget.transaction.description ??
            '(${appLocalizations.noDescription.toLowerCase()})'),
        subtitle: Text(DefaultFormats.day(widget.transaction.date)),
        trailing: ValueListenableBuilder(
          valueListenable: isLoading,
          builder: (context, bool isLoadingValue, child) {
            if (isLoadingValue) {
              return const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DefaultFormats.currency(widget.transaction.amount),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: widget.transaction.amount > 0
                        ? DefaultColors.positiveGreen
                        : DefaultColors.negativeRed,
                  ),
                ),
                const SizedBox(width: DefaultSpaces.s),
                IconButton(
                  onPressed: () {
                    isLoading.value = true;
                    widget
                        .onDelete()
                        .whenComplete(() => isLoading.value = false);
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
