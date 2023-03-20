class RoutePaths {
  RoutePaths._();

  static const String home = '/';
  static const String failure = '/failure';
  static String addTransaction({required DateTime monthDate}) =>
      '/add-transaction/${monthDate.year}/${monthDate.month}';
  static const String addTransactionDeclaration =
      '/add-transaction/:year/:month';
  static const String config = '/config';
}
