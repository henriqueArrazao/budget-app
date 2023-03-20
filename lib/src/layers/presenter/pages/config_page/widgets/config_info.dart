import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';
import 'package:sample_project/src/core/defaults/default_regex.dart';
import 'package:sample_project/src/core/defaults/default_validators.dart';

class ConfigInfoInputForm extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final bool acceptNegative;
  const ConfigInfoInputForm({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.textInputAction,
    required this.acceptNegative,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 200,
          child: TextFormField(
            autofocus: autoFocus,
            validator: DefaultValidators.dollarValidator(
              appLocalizations: AppLocalizations.of(context)!,
              acceptNegative: acceptNegative,
            ),
            textAlign: TextAlign.center,
            controller: controller,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1,
                ),
              ),
              prefixText: '${NumberFormat.simpleCurrency().currencySymbol} ',
            ),
            onFieldSubmitted: (_) => Form.of(context).validate(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  DefaultRegexes.positiveAndNegativeDoubleForInput),
            ],
            textInputAction: textInputAction,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
