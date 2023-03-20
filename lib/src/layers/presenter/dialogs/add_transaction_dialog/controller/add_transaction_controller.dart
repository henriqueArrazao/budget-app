import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/src/core/extensions/string_extension.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/layers/data/models/create_transaction_model.dart';
import 'package:sample_project/src/layers/data/repositories/transactions_repository.dart';

import 'add_transaction_state.dart';

class AddTransactionController extends ValueNotifier<AddTransactionState> {
  final TransactionsRepository _transactionsRepository;
  AddTransactionController({
    required TransactionsRepository transactionsRepository,
    required DateTime monthDate,
  })  : _transactionsRepository = transactionsRepository,
        super(AddTransactionState(
          isLoading: false,
          date: _getInitialDate(monthDate: monthDate),
        ));

  static DateTime _getInitialDate({
    required DateTime monthDate,
  }) {
    final now = DateTime.now();
    if (DateTime(monthDate.year, monthDate.month) ==
        DateTime(now.year, now.month)) {
      return DateTime(now.year, now.month, now.day);
    }
    return DateTime(monthDate.year, monthDate.month, 1);
  }

  void setDate(DateTime date) {
    value = value.copyWith(date: date);
  }

  Future<Either<Failure, void>> submit({
    required String? description,
    required double amount,
  }) async {
    value = value.copyWith(isLoading: true);
    final result = await _transactionsRepository.insertTransaction(
      CreateTransactionModel(
        description: description?.nullIfBlankOrTrim,
        amount: amount,
        date: value.date,
      ),
    );
    return result.fold((failure) {
      value = value.copyWith(isLoading: false);
      return Left(failure);
    }, (_) => const Right(null));
  }
}
