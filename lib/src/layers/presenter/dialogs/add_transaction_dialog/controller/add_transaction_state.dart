class AddTransactionState {
  final bool isLoading;
  late final DateTime date;

  AddTransactionState({
    required this.isLoading,
    required this.date,
  });

  AddTransactionState copyWith({
    bool? isLoading,
    DateTime? date,
  }) {
    return AddTransactionState(
      isLoading: isLoading ?? this.isLoading,
      date: date ?? this.date,
    );
  }
}
