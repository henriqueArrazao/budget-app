import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/src/core/defaults/default_formats.dart';

void main() {
  test('monthAndYear function', () {
    expect(DefaultFormats.monthAndYear(DateTime(2020, 1, 1)), 'January 2020');
  });

  test('day function', () {
    expect(DefaultFormats.day(DateTime(2023, 3, 20)), 'Monday, 20');
  });

  test('currencyToInput function', () {
    expect(DefaultFormats.currencyToInput(1.0), '1.00');
    expect(DefaultFormats.currencyToInput(1.1), '1.10');
    expect(DefaultFormats.currencyToInput(1000), '1000.00');
  });
}
