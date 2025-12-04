import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/header.dart';

Widget wideHeader() => const SizedBox(width: 1200, child: AppHeader());

void main() {
  testWidgets('Header displays sale banner', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(
      find.text(
          'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
      findsOneWidget,
    );
  });

  testWidgets('Header displays Home button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('Header displays Print Shack button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.text('The Print Shack'), findsOneWidget);
  });

  testWidgets('Header displays SALE button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.text('SALE!'), findsOneWidget);
  });

  testWidgets('Header displays UPSU.net button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.text('UPSU.net'), findsOneWidget);
  });

  testWidgets('Header displays search icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('Header displays shopping bag icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });

  testWidgets('Header displays menu icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });

  testWidgets('Header logo loads', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: wideHeader())));
    await tester.pump();
    expect(find.byType(Image), findsAtLeastNWidgets(1));
  });
}
