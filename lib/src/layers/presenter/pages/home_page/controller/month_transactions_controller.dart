import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/layers/data/models/transaction_model.dart';
import 'package:sample_project/src/layers/data/repositories/transactions_repository.dart';
import 'package:sample_project/src/layers/presenter/pages/home_page/controller/month_transactions_state.dart';

import 'transactions_state.dart';

class MonthTransactionsController
    extends ValueNotifier<MonthTransactionsState> {
  final TransactionsRepository _transactionsRepository;
  MonthTransactionsController({
    required TransactionsRepository transactionsRepository,
  })  : _transactionsRepository = transactionsRepository,
        super(MonthTransactionsState(
          monthDate: DateTime.now(),
          transactionsState: const TransactionsState.loading(),
        ));

  Future<void> loadMonthTransactions() async {
    value = value.copyWith(
      transactionsState: const TransactionsState.loading(),
    );
    final transactions =
        await _transactionsRepository.getTransactionsByMonth(value.monthDate);
    value = transactions.fold(
      (failure) {
        return value.copyWith(
          transactionsState: TransactionsState.error(message: failure.message),
        );
      },
      (transactions) {
        return value.copyWith(
          transactionsState: TransactionsState.loaded(
            transactionsList: transactions,
            spentAmount: transactions.fold(
              0,
              (previousValue, element) => previousValue + element.amount,
            ),
          ),
        );
      },
    );
  }

  void _setMonthDate(DateTime monthDate) {
    value = value.copyWith(monthDate: monthDate);
    loadMonthTransactions();
  }

  void goToNextMonth() {
    final currDate = value.monthDate;
    final nextMonthDate = DateTime(currDate.year, currDate.month + 1);
    _setMonthDate(nextMonthDate);
  }

  void goToPreviousMonth() {
    final currDate = value.monthDate;
    final prevMonthDate = DateTime(currDate.year, currDate.month - 1);
    _setMonthDate(prevMonthDate);
  }

  Future<Either<Failure, void>> deleteTransaction(
      TransactionModel transaction) async {
    final result = await _transactionsRepository.deleteTransaction(transaction);
    if (result.isRight()) {
      loadMonthTransactions();
    }
    return result;
  }
}
