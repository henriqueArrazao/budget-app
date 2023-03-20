import 'transactions_state.dart';

class MonthTransactionsState {
  final TransactionsState transactionsState;
  final DateTime monthDate;

  MonthTransactionsState({
    required this.transactionsState,
    required this.monthDate,
  });

  MonthTransactionsState copyWith({
    TransactionsState? transactionsState,
    DateTime? monthDate,
  }) {
    return MonthTransactionsState(
      transactionsState: transactionsState ?? this.transactionsState,
      monthDate: monthDate ?? this.monthDate,
    );
  }

  bool get isNextMonthBtnEnabled {
    final now = DateTime.now();
    return DateTime(now.year, now.month)
        .isAfter(DateTime(monthDate.year, monthDate.month));
  }
}
