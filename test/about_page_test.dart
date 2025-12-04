import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';

void main() {
  testWidgets('About page displays title', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: AboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('About us'), findsOneWidget);
  });

  testWidgets('About page displays welcome message',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: AboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('Welcome to the Union Shop!'), findsOneWidget);
  });

  testWidgets('About page has personalisation service text',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: AboutPage(includeChrome: false)));
    await tester.pump();

    final richTexts = tester.widgetList<RichText>(find.byType(RichText));
    final hasPhrase = richTexts
        .any((rt) => rt.text.toPlainText().contains('personalisation service'));
    expect(hasPhrase, isTrue);
  });

  testWidgets('About page displays contact email', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: AboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.textContaining('hello@upsu.net'), findsOneWidget);
  });

  testWidgets('About page displays team signature',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: AboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('The Union Shop & Reception Team'), findsOneWidget);
  });

  testWidgets('About page displays Happy shopping message',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: AboutPage(includeChrome: false)));
    await tester.pump();
    expect(find.text('Happy shopping!'), findsOneWidget);
  });
}
