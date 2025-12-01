import 'dart:async';
import 'package:flutter/material.dart';
import 'package:union_shop/product_detail_page.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/footer.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/product-detail': (context) => const ProductDetailPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _Slide {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText; // NEW
  final String? buttonRoute; // OPTIONAL: per‑slide navigation
  const _Slide({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText, // NEW
    this.buttonRoute, // OPTIONAL
  });
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  // Replace _heroImages with _slides
  final List<_Slide> _slides = const [
    _Slide(
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
      title: 'Essential Range - Over 20% Off!',
      subtitle:
          'Over 20% off our essential range. Come and grab yours while stocks last!',
      buttonText: 'BROWSE COLLECTION',
      buttonRoute: '/product-detail',
    ),
    _Slide(
      imageUrl:
          'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
      title: 'The Print Shack',
      subtitle:
          'Let\'s create something uniquely you with our personalisation service — From £3 for one line of text!',
      buttonText: 'FIND OUT MORE',
      buttonRoute: '/product-detail',
    ),
    _Slide(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS76eQqot6FBCBRzVxbKp1EQ4YekVoFDwbhww&s',
      title: 'Hungry?',
      subtitle: 'We got this',
      buttonText: 'ORDER DOMINO\'S PIZZA NOW',
      buttonRoute: '/product-detail',
    ),
    _Slide(
      imageUrl: 'assets/images/harry_law_bedroom_600x400.png',
      title: 'What\'s your next move...',
      subtitle: 'Are you with us?',
      buttonText: 'FIND YOUR STUDENT ACCOMMODATION',
      buttonRoute: '/product-detail',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer =
        Timer.periodic(const Duration(seconds: 10), (_) => _goNext());
  }

  void _goPrev() {
    final last = _slides.length - 1;
    final target = _currentPage == 0 ? last : _currentPage - 1;
    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _goNext() {
    final last = _slides.length - 1;
    final target = _currentPage == last ? 0 : _currentPage + 1;
    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Hero Section (carousel with changing text)
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: _slides.length,
                          onPageChanged: (i) =>
                              setState(() => _currentPage = i),
                          itemBuilder: (context, index) {
                            final s = _slides[index];
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(s.imageUrl, fit: BoxFit.cover),
                                Container(
                                    color: Colors.black.withOpacity(0.45)),
                              ],
                            );
                          },
                        ),
                      ),
                      // Overlay text driven by _currentPage
                      Positioned(
                        left: 24,
                        right: 24,
                        top: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _slides[_currentPage].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _slides[_currentPage].subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {
                                final s = _slides[_currentPage];
                                if (s.buttonRoute != null) {
                                  Navigator.pushNamed(context, s.buttonRoute!);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              child: Text(
                                _slides[_currentPage]
                                    .buttonText, // CHANGED: per‑slide label
                                style: const TextStyle(letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Arrow + dots bar
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 16,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Previous',
                                  onPressed: _goPrev,
                                  icon: const Icon(Icons.chevron_left),
                                  color: Colors.white,
                                  splashRadius: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    _slides.length,
                                    (i) => GestureDetector(
                                      onTap: () =>
                                          _pageController.animateToPage(
                                        i,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.easeOut,
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: i == _currentPage
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Next',
                                  onPressed: _goNext,
                                  icon: const Icon(Icons.chevron_right),
                                  color: Colors.white,
                                  splashRadius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Essential Range section (placed ABOVE Signature Range)
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.70, // CHANGE from 0.80 to 0.70 (gives more height)
                      mainAxisSpacing: 40, // INCREASE from 24 to 40
                      crossAxisSpacing: 24,
                    ),
                    children: const [
                      ProductCard(
                        id: '7',
                        title: 'Limited Edition Essential Zip Hoodies',
                        price: '£14.99',
                        oldPrice: '£20.00', // NEW
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
                      ),
                      ProductCard(
                        id: '8',
                        title: 'Essential T-Shirt',
                        price: '£6.99',
                        oldPrice: '£10.00', // NEW
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                      ),
                    ],
                  ),
                ),

                // Signature Range section
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'SIGNATURE RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.70, // CHANGE from 0.80 to 0.70 (gives more height)
                      mainAxisSpacing: 40, // INCREASE from 24 to 40
                      crossAxisSpacing: 24,
                    ),
                    children: const [
                      ProductCard(
                        id: '5',
                        title: 'Signature Hoodie',
                        price: '£32.99',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
                      ),
                      ProductCard(
                        id: '6',
                        title: 'Signature T-Shirt',
                        price: '£14.99',
                        imageUrl:
                            'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
                      ),
                    ],
                  ),
                ),

                // Products Section
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Text(
                          'PORTSMOUTH CITY COLLECTION',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 48),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing:
                              64, // INCREASE vertical gap between rows
                          children: const [
                            ProductCard(
                              id: '1',
                              title: 'Portsmouth City Postcard',
                              price: '£1.00',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                            ),
                            ProductCard(
                              id: '2',
                              title: 'Portsmouth City Magnet',
                              price: '£4.50',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            ),
                            ProductCard(
                              id: '3',
                              title: 'Portsmouth City Bookmark',
                              price: '£3.00',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_1024x1024@2x.jpg?v=1752230004',
                            ),
                            ProductCard(
                              id: '4',
                              title: 'Portsmouth City Notebook',
                              price: '£7.50',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityNotebook_1024x1024@2x.jpg?v=1757419215',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // VIEW ALL button
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: navigate to a catalog route or perform an action
                      Navigator.pushNamed(context, '/product-detail');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'VIEW ALL',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // OUR RANGE title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'OUR RANGE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Category tiles grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // 2 columns on narrow, 4 on wide
                      final crossAxisCount = constraints.maxWidth < 700 ? 2 : 4;
                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          _CategoryTile(
                            label: 'Clothing',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                          ),
                          _CategoryTile(
                            label: 'Merchandise',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
                          ),
                          _CategoryTile(
                            label: 'Graduation',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
                          ),
                          _CategoryTile(
                            label: 'SALE',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),

                // Footer
                const AppFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String? oldPrice; // NEW

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.oldPrice, // NEW
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24), // ADD margin to separate rows
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/product-detail', arguments: id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (oldPrice != null) ...[
                  Text(
                    oldPrice!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Simple reusable category tile
class _CategoryTile extends StatelessWidget {
  final String label;
  final String imageUrl;
  const _CategoryTile({required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: route per category
        Navigator.pushNamed(context, '/product-detail');
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black.withOpacity(0.35),
              ),
            ),
          ),
          Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
