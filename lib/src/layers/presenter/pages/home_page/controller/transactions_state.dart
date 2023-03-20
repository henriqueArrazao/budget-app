import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_project/src/layers/data/models/transaction_model.dart';

part 'transactions_state.freezed.dart';

@freezed
@immutable
class TransactionsState with _$TransactionsState {
  const TransactionsState._();

  const factory TransactionsState.loaded({
    required List<TransactionModel> transactionsList,
    required double spentAmount,
  }) = LoadedTransactionsState;

  const factory TransactionsState.error({
    required String? message,
  }) = ErrorTransactionsState;

  const factory TransactionsState.loading() = LoadingTransactionsState;
}
