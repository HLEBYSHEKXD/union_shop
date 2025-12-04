import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_about_page.dart';

void main() {
  testWidgets('Print Shack page displays title', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('The Union Print Shack'), findsOneWidget);
  });

  testWidgets('Print Shack page displays Make It Yours section',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('Make It Yours at The Union Print Shack'), findsOneWidget);
  });

  testWidgets('Print Shack page displays pricing section',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('Simple Pricing, No Surprises'), findsOneWidget);
  });

  testWidgets('Print Shack page displays terms section',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('Personalisation Terms & Conditions'), findsOneWidget);
  });

  testWidgets('Print Shack page displays Ready section',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('Ready to Make It Yours?'), findsOneWidget);
  });

  testWidgets('Print Shack page mentions pricing details',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.textContaining('£3'), findsOneWidget);
    expect(find.textContaining('£5'), findsOneWidget);
  });

  testWidgets('Print Shack page has refund policy',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: PrintShackAboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.textContaining('Refunds are not provided'), findsOneWidget);
  });
}
