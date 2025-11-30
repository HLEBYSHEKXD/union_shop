import 'package:flutter/material.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/footer.dart';

// CHANGE: Make Stateful (needed for image/color/size selection)
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void placeholderCallbackForButtons() {}

  // CHANGE: Added images / colors / sizes for signature products (5,6)
  Map<String, Map<String, dynamic>> getProductData() {
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
      // Signature Range Hoodie
      '5': {
        'name': 'Signature Hoodie',
        'price': '£32.99',
        'image': 'IMAGE_URL_SIGNATURE_HOODIE_1', // main image (replace)
        'images': [
          'IMAGE_URL_SIGNATURE_HOODIE_1', // replace
          'IMAGE_URL_SIGNATURE_HOODIE_2', // replace
          'IMAGE_URL_SIGNATURE_HOODIE_3', // replace
        ],
        'colors': ['Ivory', 'Charcoal', 'Forest'],
        'sizes': ['S', 'M', 'L', 'XL'],
        'description': 'Soft unisex hoodie with Portsmouth signature print.'
      },
      // Signature Range T-Shirt
      '6': {
        'name': 'Signature T-Shirt',
        'price': '£14.99',
        'image': 'IMAGE_URL_SIGNATURE_TSHIRT_1', // main image (replace)
        'images': [
          'IMAGE_URL_SIGNATURE_TSHIRT_1', // replace
          'IMAGE_URL_SIGNATURE_TSHIRT_2', // replace
          'IMAGE_URL_SIGNATURE_TSHIRT_3', // replace
        ],
        'colors': ['Ivory', 'Navy', 'Black'],
        'sizes': ['S', 'M', 'L', 'XL'],
        'description': 'Classic tee with Portsmouth signature print.'
      },
    };
  }

  String? selectedColor;
  String? selectedSize;
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final productId =
        args is String ? args : (args is int ? args.toString() : '1');
    final productData = getProductData()[productId] ?? getProductData()['1']!;
    final isSignature = productId == '5' || productId == '6';
    final images = isSignature
        ? (productData['images'] as List<String>)
        : [productData['image'] as String];

    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LEFT: Main image + thumbnails (signature only)
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: AspectRatio(
                                aspectRatio: 1.3,
                                child: Image.network(
                                  images[selectedImageIndex],
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (isSignature) ...[
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(images.length, (i) {
                                  final active = i == selectedImageIndex;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() => selectedImageIndex = i);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      padding: active
                                          ? const EdgeInsets.all(2)
                                          : EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                        border: active
                                            ? Border.all(
                                                color: Colors.black, width: 2)
                                            : null,
                                      ),
                                      width: 70,
                                      height: 70,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: Image.network(
                                          images[i],
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) =>
                                              Container(
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      // RIGHT: Info / options
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productData['name'] as String,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              productData['price'] as String,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Tax included.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 32),

                            // Signature-only options
                            if (isSignature) ...[
                              // Color
                              const Text(
                                'Color',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                value: selectedColor,
                                items: (productData['colors'] as List<String>)
                                    .map((c) => DropdownMenuItem(
                                          value: c,
                                          child: Text(c),
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => selectedColor = v),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Size
                              const Text(
                                'Size',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                value: selectedSize,
                                items: (productData['sizes'] as List<String>)
                                    .map((s) => DropdownMenuItem(
                                          value: s,
                                          child: Text(s),
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => selectedSize = v),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],

                            // Quantity
                            const Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: TextEditingController(text: '1'),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Add to cart
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: placeholderCallbackForButtons,
                                child: const Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Shop Pay
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5A4A8B),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
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
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            Center(
                              child: GestureDetector(
                                onTap: placeholderCallbackForButtons,
                                child: const Text(
                                  'More payment options',
                                  style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),

                            Text(
                              productData['description'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Share row
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
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  child: Center(
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width - 80) * 0.5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () => navigateBack(context),
                        child: const Text(
                          'BACK TO PORTSMOUTH CITY COLLECTION',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                // Footer at end (scrolls with content)
                const SizedBox(height: 32),
                const AppFooter(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
