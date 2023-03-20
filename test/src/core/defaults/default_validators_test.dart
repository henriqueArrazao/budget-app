import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations_en.dart';
import 'package:sample_project/src/core/defaults/default_validators.dart';

void main() {
  final appLocalizations = AppLocalizationsEn();
  final validator = DefaultValidators.dollarValidator(
    appLocalizations: appLocalizations,
    acceptZero: false,
    acceptNegative: false,
  );

  group('dollar validator', () {
    test('should never accept empty or null value', () {
      expect(validator(null), appLocalizations.pleaseEnterAValue);
      expect(validator(''), appLocalizations.pleaseEnterAValue);
    });

    test('should never accept non-numeric values', () {
      expect(validator('a'), appLocalizations.pleaseEnterAValidValue);
      expect(validator('1a'), appLocalizations.pleaseEnterAValidValue);
      expect(validator('a1'), appLocalizations.pleaseEnterAValidValue);
    });

    test(
        'should never accept values less than ${DefaultValidators.minDollarValue}',
        () {
      final sut = DefaultValidators.dollarValidator(
        appLocalizations: appLocalizations,
        acceptZero: false,
        acceptNegative: false,
      );
      final text = (DefaultValidators.minDollarValue - 0.1).toString();
      expect(sut(text), appLocalizations.youCantBeThatPoor);
    });

    test(
        'should never accept values greater than ${DefaultValidators.maxDollarValue}',
        () {
      final sut = DefaultValidators.dollarValidator(
        appLocalizations: appLocalizations,
        acceptZero: false,
        acceptNegative: false,
      );
      final text = (DefaultValidators.maxDollarValue + 0.1).toString();
      expect(sut(text), appLocalizations.elonMuskIsThatYou);
    });

    group('acceptZero parameter', () {
      test('as false', () {
        final sut = DefaultValidators.dollarValidator(
          appLocalizations: appLocalizations,
          acceptZero: false,
          acceptNegative: false,
        );
        expect(sut('0'), appLocalizations.zeroIsNotAllowed);
      });

      test('as true', () {
        final sut = DefaultValidators.dollarValidator(
          appLocalizations: appLocalizations,
          acceptZero: true,
          acceptNegative: false,
        );
        expect(sut('0'), null);
      });
    });

    group('acceptNegative parameter', () {
      test('as false', () {
        final sut = DefaultValidators.dollarValidator(
          appLocalizations: appLocalizations,
          acceptZero: false,
          acceptNegative: false,
        );
        expect(sut('-1'), appLocalizations.negativeValuesAreNotAllowed);
      });

      test('as true', () {
        final sut = DefaultValidators.dollarValidator(
          appLocalizations: appLocalizations,
          acceptZero: false,
          acceptNegative: true,
        );
        expect(sut('-1'), null);
      });
    });
  });
}
