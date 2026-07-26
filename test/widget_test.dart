// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:agriflow/main.dart';

void main() {
  testWidgets('Home dashboard loads and navigates to alerts', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AgriFlowApp());

    // Verify that the dashboard content is displayed.
    expect(find.textContaining('Good morning,'), findsOneWidget);
    expect(find.text('Live Sensor Summary'), findsOneWidget);

    // Tap the Alerts tab and verify that the alerts screen opens.
    final bottomNav = find.byType(BottomNavigationBar);
    final alertsIcon = find.descendant(
      of: bottomNav,
      matching: find.byIcon(Icons.notifications_outlined),
    );
    await tester.tap(alertsIcon.first);
    await tester.pumpAndSettle();

    expect(find.text('Alerts'), findsWidgets);
    expect(find.text('Poor Water Quality Detected'), findsOneWidget);
  });
}
