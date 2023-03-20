class ConfigPageState {
  final bool isLoading;
  ConfigPageState({
    this.isLoading = false,
  });
  ConfigPageState copyWith({
    bool? isLoading,
  }) {
    return ConfigPageState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
