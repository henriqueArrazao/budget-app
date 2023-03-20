import 'package:intl/intl.dart';
import 'package:sample_project/src/core/extensions/string_extension.dart';

class DefaultFormats {
  DefaultFormats._();

  static String monthAndYear(DateTime date) =>
      DateFormat.yMMMM().format(date).capitalize();

  static String day(DateTime date) =>
      DateFormat('EEEE, d').format(date).capitalize();

  static String currency(
    double value, {
    bool showSymbol = true,
  }) {
    final formatter = NumberFormat.simpleCurrency();
    String formatted = formatter.format(value);
    return formatted;
  }

  static String currencyToInput(double value) {
    return value.toStringAsFixed(2);
  }
}
