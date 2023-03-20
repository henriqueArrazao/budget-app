import 'package:flutter/material.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';

class DefaultValidators {
  DefaultValidators._();

  static double maxDollarValue = 999999999;
  static double minDollarValue = -999999999;

  static FormFieldValidator<String> dollarValidator({
    required AppLocalizations appLocalizations,
    required bool acceptNegative,
    bool acceptZero = false,
  }) {
    return (value) {
      if (value == null || value.isEmpty) {
        return appLocalizations.pleaseEnterAValue;
      }
      final doubleValue = double.tryParse(value);
      if (doubleValue == null) {
        return appLocalizations.pleaseEnterAValidValue;
      }
      if (doubleValue < minDollarValue) {
        return appLocalizations.youCantBeThatPoor;
      }
      if (doubleValue > maxDollarValue) {
        return appLocalizations.elonMuskIsThatYou;
      }
      if (!acceptZero && doubleValue == 0) {
        return appLocalizations.zeroIsNotAllowed;
      }
      if (!acceptNegative && doubleValue < 0) {
        return appLocalizations.negativeValuesAreNotAllowed;
      }
      return null;
    };
  }
}
