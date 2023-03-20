import 'package:flutter/cupertino.dart';

class ErrorLogger {
  ErrorLogger._();

  // in case some service such as Crashlytics is used, call it here
  static void log(Object error, StackTrace stackTrace, [String? reason]) async {
    debugPrint('error: $error');
    debugPrint('stackTrace: $stackTrace');
    debugPrint('reason: $reason');
  }
}
