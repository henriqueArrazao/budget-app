import 'package:flutter/material.dart';
import 'package:sample_project/services/localizations/app_localizations/app_localizations.dart';

class ErrorSnackbar extends SnackBar {
  ErrorSnackbar({
    required BuildContext context,
    required String? message,
    super.key,
  }) : super(
          content: Text(
            message ?? AppLocalizations.of(context)!.somethingWentWrong,
          ),
        );
}
