import 'package:flutter/material.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/footer.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  Map<String, Map<String, String>> getProductData() {
    return {
      '1': {
        'name': 'Portsmouth City Postcard',
        'price': '£1.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
        'description':
            'Celebrate the charm of our coastal city with this beautifully illustrated Portsmouth City Postcard, designed by British artist Julia Gash.\n\nFeaturing her signature hand-drawn style, this postcard captures Portsmouth’s most iconic landmarks - from the Spinnaker Tower to the historic seafront - all brought to life in bold lines and vibrant colours.\n\nPerfect for sending home, pinning on your wall, or keeping as a personal keepsake, it’s a fun and affordable way to show off your Portsmouth pride.',
      },
      '2': {
        'name': 'Portsmouth City Magnet',
        'price': '£4.50',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        'description':
            'Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, featuring the artwork of renowned illustrator Julia Gash.\n\nPart of our Portsmouth City Collection, this magnet showcases Julia’s iconic hand-drawn design, celebrating the city’s most loved landmarks and seaside charm in her signature playful style.\n\nMade from durable tin plate, it\'s both lightweight and long-lasting - a perfect souvenir or small gift with a big personality.',
      },
      '3': {
        'name': 'Portsmouth City Bookmark',
        'price': '£3.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_1024x1024@2x.jpg?v=1752230004',
        'description':
            'Add a touch of local charm to your reading with this beautifully illustrated Portsmouth City Bookmark, designed by British artist Julia Gash.\n\nFeaturing her signature hand-drawn style, this bookmark showcases some of Portsmouth’s most iconic landmarks - from the Spinnaker Tower to historic seafront scenes - all brought to life in bold lines and bright colours.\n\nWhether you\'re marking your place in a textbook or gifting a little piece of Portsmouth to a friend, this bookmark is a fun, practical keepsake that celebrates our coastal city.',
      },
      '4': {
        'name': 'Portsmouth City Notebook',
        'price': '£7.50',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityNotebook_1024x1024@2x.jpg?v=1757419215',
        'description':
            'Jot down your thoughts, sketches, or seaside daydreams with our charming Portsmouth City Notebook, featuring the artwork of renowned illustrator Julia Gash.\n\nPart of our Portsmouth City Collection, this notebook showcases Julia’s iconic hand-drawn design, capturing the city\'s much-loved landmarks and coastal charm in her signature playful style.\n\nWith plain, high-quality pages and a sturdy cover, it\'s perfect for notes, doodles, or travel memories – a practical yet inspiring gift or souvenir with true Portsmouth personality.',
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final productId = args is String
        ? args
        : args is int
            ? args.toString()
            : '1';
    final productData = getProductData()[productId]!;

    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product details container
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side - Product image
                        Expanded(
                          flex: 1,
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                productData['image']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    height: 400,
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 60),

                        // Right side - Product info and description
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product name
                                Text(
                                  productData['name']!,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Product price
                                Text(
                                  productData['price']!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Tax included text
                                const Text(
                                  'Tax included.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 32),

                                // Quantity label
                                const Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Quantity input
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    controller:
                                        TextEditingController(text: '1'),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                                const SizedBox(height: 32),

                                // Add to cart button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        side: const BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                    child: const Text(
                                      'ADD TO CART',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Buy with shop button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF5A4A8B),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                    child: const Text(
                                      'Buy with Shop Pay',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 12),

                                // More payment options
                                Center(
                                  child: GestureDetector(
                                    onTap: placeholderCallbackForButtons,
                                    child: const Text(
                                      'More payment options',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 32),

                                // Product description below buttons (aligned on the right)
                                Text(
                                  productData['description']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    height: 1.6,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Social share row placed under the description (Share, Tweet, Pin it)
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: placeholderCallbackForButtons,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.share,
                                              color: Colors.blue, size: 18),
                                          SizedBox(width: 8),
                                          Text(
                                            'SHARE',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: placeholderCallbackForButtons,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.favorite_border,
                                              color: Colors.blue, size: 18),
                                          SizedBox(width: 8),
                                          Text(
                                            'TWEET',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: placeholderCallbackForButtons,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.bookmark_border,
                                              color: Colors.red, size: 18),
                                          SizedBox(width: 8),
                                          Text(
                                            'PIN IT',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Back button (half content width, centered)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    child: Center(
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 80) * 0.5,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () => navigateBack(context),
                          child: const Text(
                            'BACK TO PORTSMOUTH CITY COLLECTION',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Footer
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
