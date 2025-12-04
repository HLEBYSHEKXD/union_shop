import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_detail_page.dart';

void main() {
  group('ProductDetailPage', () {
    testWidgets('displays product name', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('Portsmouth City Postcard'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays product price', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('£1.00'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays product description', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Celebrate the charm'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays product with old price', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '7', // Limited Edition Essential Zip Hoodies
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays color and size options for products with variants',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '5', // Signature Hoodie
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('Color'), findsOneWidget);
      expect(find.text('Size'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays multiple images as thumbnails',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '2', // Portsmouth City Magnet (has 2 images)
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      // Should find main image + thumbnails
      expect(find.byType(Image), findsAtLeastNWidgets(2));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays add to cart button', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('ADD TO CART'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Buy with Shop Pay button',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('Buy with Shop Pay'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays quantity selector', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('Quantity'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays social sharing buttons', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('SHARE'), findsOneWidget);
      expect(find.text('TWEET'), findsOneWidget);
      expect(find.text('PIN IT'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays back button', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('BACK TO PORTSMOUTH CITY COLLECTION'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('can change color selection', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '5', // Signature Hoodie with colors
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      // Find the color dropdown
      final colorDropdown = find.byType(DropdownButtonFormField<String>).first;
      expect(colorDropdown, findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays tax included text', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
                  body: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: '1',
                    ),
                    child: const Text('Go'),
                  ),
                ),
            '/product': (context) => const ProductDetailPage(),
          },
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('Tax included.'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}
