import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/footer.dart';

void main() {
  testWidgets('Footer displays', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.byType(AppFooter), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays Opening Hours section',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('Opening Hours'), findsOneWidget);
    expect(find.textContaining('Winter Break Closure Dates'), findsOneWidget);
    expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays Help and Information section',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('Help and Information'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Terms & Conditions of Sale Policy'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays Latest Offers section',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('Latest Offers'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('SUBSCRIBE'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays social media icons',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.facebook), findsOneWidget);
    expect(find.byIcon(Icons.message), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays copyright information',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.textContaining('© 2025'), findsOneWidget);
    expect(find.text('upsu-store'), findsOneWidget);
    expect(find.textContaining('Powered by Shopify'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer has light gray background', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    final Container footerContainer = tester.widget(find
        .descendant(
          of: find.byType(AppFooter),
          matching: find.byType(Container),
        )
        .first);

    expect(footerContainer.color, const Color(0xFFF5F5F5));

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer subscribe button is clickable',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    final subscribeFinder = find.text('SUBSCRIBE');
    expect(subscribeFinder, findsOneWidget);

    await tester.tap(subscribeFinder);
    await tester.pump();

    expect(tester.takeException(), isNull);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer email input is editable', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'test@example.com');
    await tester.pump();

    expect(find.text('test@example.com'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays three main columns',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('Opening Hours'), findsOneWidget);
    expect(find.text('Help and Information'), findsOneWidget);
    expect(find.text('Latest Offers'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer renders without errors', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));

    expect(tester.takeException(), isNull);

    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays winter break dates',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('Closing 4pm 19/12/2025'), findsOneWidget);
    expect(find.text('Reopening 10am 05/01/2026'), findsOneWidget);
    expect(find.textContaining('Last post date'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays term time hours', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('(Term Time)'), findsOneWidget);
    expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer displays outside term time hours',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.textContaining('Outside of Term Time'), findsOneWidget);
    expect(find.text('Monday - Friday 10am - 3pm'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('Footer emphasizes 24/7 online shopping',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: AppFooter())));
    await tester.pumpAndSettle();

    expect(find.text('Purchase online 24/7'), findsOneWidget);

    addTearDown(() => tester.view.resetPhysicalSize());
  });
}
