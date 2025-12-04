import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('UnionShopApp', () {
    testWidgets('creates MaterialApp with correct routes', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.byType(MaterialApp), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('starts with home screen', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.byType(HomeScreen), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });

  group('HomeScreen', () {
    testWidgets('displays header', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(
        find.text(
          'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
        ),
        findsOneWidget,
      );
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays carousel', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.byType(PageView), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays carousel with slides', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('Essential Range - Over 20% Off!'), findsOneWidget);
      expect(find.text('BROWSE COLLECTION'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays category tiles', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('Clothing'), findsOneWidget);
      expect(find.text('Merchandise'), findsOneWidget);
      expect(find.text('Graduation'), findsOneWidget);
      expect(find.text('SALE'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('carousel next button works', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      final nextButton = find.byIcon(Icons.chevron_right);
      expect(nextButton, findsOneWidget);
      await tester.tap(nextButton);
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(PageView), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('carousel previous button works', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      final prevButton = find.byIcon(Icons.chevron_left);
      expect(prevButton, findsOneWidget);
      await tester.tap(prevButton);
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(PageView), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Essential Range section', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('ESSENTIAL RANGE - OVER 20% OFF!'), findsOneWidget);
      expect(
          find.text('Limited Edition Essential Zip Hoodies'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Signature Range section', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('SIGNATURE RANGE'), findsOneWidget);
      expect(find.text('Signature Hoodie'), findsOneWidget);
      expect(find.text('Signature T-Shirt'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Portsmouth City Collection', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('PORTSMOUTH CITY COLLECTION'), findsOneWidget);
      expect(find.text('Portsmouth City Postcard'), findsOneWidget);
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('Portsmouth City Bookmark'), findsOneWidget);
      expect(find.text('Portsmouth City Notebook'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays VIEW ALL button', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('VIEW ALL'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Our Range section', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('OUR RANGE'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays carousel navigation dots', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pump(const Duration(milliseconds: 50));
      final dots = find.byType(GestureDetector);
      expect(dots, findsAtLeastNWidgets(4));
      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });

  group('ProductCard', () {
    testWidgets('displays product information', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: '1',
              title: 'Test Product',
              price: '£10.00',
              imageUrl: 'https://example.com/image.jpg',
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('shows old price when provided', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: '1',
              title: 'Sale Product',
              price: '£8.00',
              oldPrice: '£10.00',
              imageUrl: 'https://example.com/image.jpg',
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('£8.00'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('is tappable', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => const Scaffold(
                  body: ProductCard(
                    id: '1',
                    title: 'Test Product',
                    price: '£10.00',
                    imageUrl: 'https://example.com/image.jpg',
                  ),
                ),
            '/product-detail': (context) =>
                const Scaffold(body: Text('Product Detail')),
          },
        ),
      );
      await tester.pump(const Duration(milliseconds: 50));
      await tester.tap(find.byType(InkWell));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Product Detail'), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays product image', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: '1',
              title: 'Test Product',
              price: '£10.00',
              imageUrl: 'https://example.com/image.jpg',
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 50));
      expect(find.byType(Image), findsOneWidget);
      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}
