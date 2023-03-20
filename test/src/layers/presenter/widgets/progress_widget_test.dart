import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/src/layers/presenter/widgets/progress_widget.dart';

void main() {
  Future callbackGenerator({
    required WidgetTester tester,
    required double fraction,
    required double expectedFraction,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: ProgressWidget(fraction: fraction)),
        ),
      ),
    );

    final progress = find.byKey(ProgressWidget.progressBarKey);
    final container = find.byType(ProgressWidget);

    final progressBarRect = tester.getRect(progress);
    final containerRect = tester.getRect(container);

    expect(progressBarRect.width, containerRect.width * expectedFraction);
  }

  testWidgets(
    'if fraction is less than 0, progress bar should be 0 width',
    (WidgetTester tester) =>
        callbackGenerator(tester: tester, fraction: -1, expectedFraction: 0),
  );

  testWidgets(
    'if fraction is more than 1, progress bar should be 100% width',
    (WidgetTester tester) =>
        callbackGenerator(tester: tester, fraction: 2, expectedFraction: 1),
  );

  testWidgets(
    'if fraction is 0.7, progress bar should be 70% width',
    (WidgetTester tester) =>
        callbackGenerator(tester: tester, fraction: 0.7, expectedFraction: 0.7),
  );
}
