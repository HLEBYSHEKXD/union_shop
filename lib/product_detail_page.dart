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
  String? selectedColor;
  String? selectedSize;
  int selectedImageIndex = 0; // keep state here, do NOT reset in build

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
      // Portsmouth City Magnet — add a second image slot
      '2': {
        'name': 'Portsmouth City Magnet',
        'price': '£4.50',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        // Add images list; put your second image URL below
        'images': [
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          'https://shop.upsu.net/cdn/shop/files/Portsmouth_City_Magnet_3_1024x1024@2x.jpg?v=1752230299', // TODO: paste your second image link here
        ],
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
        // main image now set to first images entry (no placeholder)
        'image':
            'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
        'images': [
          'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
          'https://shop.upsu.net/cdn/shop/files/Ivory_Hoodie_1024x1024@2x.png?v=1745583522',
          'https://shop.upsu.net/cdn/shop/files/Outdoor_Shot_New_Hoodies_1024x1024@2x.png?v=1745583567',
        ],
        'colors': ['Sage', 'Ivory'],
        'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
        'description':
            'Crafted for comfort, elevated with detail — our Signature hoodies feature premium embroidery that sets them apart from our classic range. With a clean design and an oversized fit, they bring a refined edge to a classic silhouette. Whether you\'re layering up or keeping it simple, this is your new go-to for effortless style.',
      },
      // Signature Range T-Shirt
      '6': {
        'name': 'Signature T-Shirt',
        'price': '£14.99',
        'image':
            'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
        'images': [
          'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
          'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Sand_2_e4a45eaf-fe5f-419e-bb2c-dd437ae6f594_1024x1024@2x.jpg?v=1758290534',
        ],
        'colors': ['Sand', 'Indigo Blue'],
        'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
        'description':
            'Clean. Classic. Elevated.\n\nOur Signature T-shirts combine everyday comfort with premium detail. Featuring high-quality embroidery and a relaxed fit, they offer a fresh take on a staple piece. Lightweight and versatile, this tee is perfect for layering or wearing solo - an essential addition to any wardrobe.',
      },
      // 7) Limited Edition Essential Zip Hoodies — 4 images
      '7': {
        'name': 'Limited Edition Essential Zip Hoodies',
        'price': '£14.99',
        'image':
            'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
        'images': [
          'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
          'https://shop.upsu.net/cdn/shop/files/1000045774_07de1185-b921-47fa-b3a8-b1823478ca2b_1024x1024@2x.jpg?v=1749131089',
          'https://shop.upsu.net/cdn/shop/files/Baby_Pink_Shopify_Image_1024x1024@2x.png?v=1749460435',
          'https://shop.upsu.net/cdn/shop/files/Blue_Stone_Shopify_Image_1024x1024@2x.png?v=1749460441',
        ],
        'description':
            'Redesigned with a fresh chest logo, our limited addition Baby Pink and Stone Blue Hoodies are ultra cosy made for everyday wear with a modern twist. Soft, durable, and effortlessly versatile. ',
      },

      // 8) Essential T-Shirt — 2 images
      '8': {
        'name': 'Essential T-Shirt',
        'price': '£6.99',
        'image':
            'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
        'images': [
          'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
          'https://shop.upsu.net/cdn/shop/files/LightBlueT-shirt_1024x1024@2x.png?v=1759827236',
        ],
        'description':
            'Redesigned with a fresh chest logo, our Essential T-shirts are made for everyday wear with a modern twist. Soft, durable, and effortlessly versatile — these are the elevated basics your wardrobe\'s been waiting for.',
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final productId =
        args is String ? args : (args is int ? args.toString() : '1');
    final productData = getProductData()[productId] ?? getProductData()['1']!;
    final isSignature = productId == '5' || productId == '6';

    // Build the images list once per build
    final List<String> images = (productData['images'] is List &&
            (productData['images'] as List).isNotEmpty)
        ? (productData['images'] as List).cast<String>() // ensure List<String>
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
                      // LEFT: main + thumbnails
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Main image shows current index
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: AspectRatio(
                                aspectRatio: 1.3,
                                child: Image.network(
                                  images[selectedImageIndex],
                                  key: ValueKey<int>(
                                      selectedImageIndex), // force rebuild on change
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                        child: Icon(Icons.image_not_supported)),
                                  ),
                                ),
                              ),
                            ),
                            if (images.length > 1) ...[
                              const SizedBox(height: 16),
                              // Thumbnails (click to change main image)
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: List.generate(images.length, (i) {
                                  final active = i == selectedImageIndex;
                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedImageIndex =
                                              i; // change main image to clicked thumbnail
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          border: active
                                              ? Border.all(
                                                  color: Colors.black, width: 2)
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          child: Image.network(
                                            images[i],
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                Container(
                                                    color: Colors.grey[300]),
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

                      // RIGHT: colour dropdown must also set selectedImageIndex
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productData['name'] as String,
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            Text(productData['price'] as String,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            const Text('Tax included.',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            const SizedBox(height: 32),
                            if (isSignature) ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Colour',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 8),
                                        DropdownButtonFormField<String>(
                                          value: selectedColor,
                                          items: (productData['colors'] as List)
                                              .cast<String>()
                                              .map((c) => DropdownMenuItem(
                                                  value: c, child: Text(c)))
                                              .toList(),
                                          onChanged: (v) {
                                            setState(() {
                                              selectedColor = v;
                                              // Mapping for signature items
                                              if (productId == '6') {
                                                // T-Shirt: Indigo Blue -> 0, Sand -> 1
                                                selectedImageIndex =
                                                    (selectedColor == 'Sand')
                                                        ? 1
                                                        : 0;
                                              } else if (productId == '5') {
                                                // Hoodie: Ivory -> 1, Sage -> 0
                                                selectedImageIndex =
                                                    (selectedColor == 'Ivory')
                                                        ? 1
                                                        : 0;
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Size',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 8),
                                        DropdownButtonFormField<String>(
                                          value: selectedSize,
                                          items: (productData['sizes']
                                                  as List<String>)
                                              .map((s) => DropdownMenuItem(
                                                  value: s, child: Text(s)))
                                              .toList(),
                                          onChanged: (v) =>
                                              setState(() => selectedSize = v),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                            ],
                            const Text('Quantity',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: TextEditingController(text: '1'),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                onPressed: placeholderCallbackForButtons,
                                child: const Text('ADD TO CART',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5A4A8B),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                onPressed: placeholderCallbackForButtons,
                                child: const Text('Buy with Shop Pay',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: GestureDetector(
                                onTap: placeholderCallbackForButtons,
                                child: const Text('More payment options',
                                    style: TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline)),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(productData['description'] as String,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    height: 1.6)),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: placeholderCallbackForButtons,
                                  child: const Row(
                                    children: [
                                      Icon(Icons.share,
                                          color: Colors.blue, size: 18),
                                      SizedBox(width: 8),
                                      Text('SHARE',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue)),
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
                                      Text('TWEET',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue)),
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
                                      Text('PIN IT',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red)),
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
                        child: const Text('BACK TO PORTSMOUTH CITY COLLECTION',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
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
