import 'package:flutter/material.dart';
import 'main.dart'; // to reuse ProductCard (or move ProductCard to its own file)

// Simple product data model
class Product {
  final String id;
  final String title;
  final String price; // formatted string (e.g. £3.00)
  final String imageUrl;
  final String? oldPrice;
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.oldPrice,
  });
}

// Arguments passed when navigating to the universal list page
class ProductListArgs {
  final String pageTitle;
  final String? heroImageUrl;
  final String? introText;
  final List<Product> products;
  const ProductListArgs({
    required this.pageTitle,
    required this.products,
    this.heroImageUrl,
    this.introText,
  });
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ProductListArgs?;

    if (args == null) {
      return const Scaffold(
        body: Center(child: Text('No products provided')),
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (args.heroImageUrl != null)
            SizedBox(
              height: 260,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(args.heroImageUrl!, fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.45)),
                  Center(
                    child: Text(
                      args.pageTitle,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
              child: Text(
                args.pageTitle,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (args.introText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                args.introText!,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
          // Filters placeholder (expand later)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: 'All',
                    items: const [
                      DropdownMenuItem(
                          value: 'All', child: Text('All products')),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: 'Best selling',
                    items: const [
                      DropdownMenuItem(
                          value: 'Best selling', child: Text('Best selling')),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(width: 16),
                Text('${args.products.length} products'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Product grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth < 700 ? 2 : 4;
                final itemWidth =
                    (constraints.maxWidth - (16 * (crossAxisCount - 1))) /
                        crossAxisCount;
                return Wrap(
                  spacing: 16,
                  runSpacing: 32,
                  children: args.products.map((p) {
                    return SizedBox(
                      width: itemWidth,
                      child: ProductCard(
                        id: p.id,
                        title: p.title,
                        price: p.price,
                        imageUrl: p.imageUrl,
                        oldPrice: p.oldPrice,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
