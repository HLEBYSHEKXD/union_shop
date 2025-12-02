import 'package:flutter/material.dart';
import 'package:union_shop/product_list_page.dart';
import 'package:union_shop/print_shack_about_page.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Purple info bar
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: const Color(0xFF4d2963),
          child: const Text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        // Main nav bar
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 64,
          child: Row(
            children: [
              Image.network(
                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                height: 28,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      },
                      child: const Text('Home'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () {}, child: const Text('Shop')),
                    const SizedBox(width: 8),

                    // The Print Shack popup menu
                    PopupMenuButton<String>(
                      tooltip: 'The Print Shack',
                      offset: const Offset(0, 24),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'The Print Shack',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.keyboard_arrow_down, size: 18),
                          ],
                        ),
                      ),
                      onSelected: (value) {
                        switch (value) {
                          case 'about':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PrintShackAboutPage()),
                            );
                            break;
                          case 'personalisation':
                            Navigator.pushNamed(
                              context,
                              '/products',
                              arguments: const ProductListArgs(
                                pageTitle: 'Personalisation',
                                heroImageUrl:
                                    'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
                                introText:
                                    'Create custom merchandise with our personalisation service.',
                                products: [
                                  Product(
                                    id: '26',
                                    title: 'Personalised Item',
                                    price: '£15.00',
                                    imageUrl:
                                        'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
                                  ),
                                ],
                              ),
                            );
                            break;
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 'about', child: Text('About')),
                        PopupMenuItem(
                            value: 'personalisation',
                            child: Text('Personalisation')),
                      ],
                    ),

                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/products',
                          arguments: const ProductListArgs(
                            pageTitle: 'SALE',
                            heroImageUrl:
                                'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
                            introText:
                                'Don’t miss out! Get yours before they’re all gone!\n\nAll prices shown are inclusive of the discount 🛒',
                            products: [
                              Product(
                                id: '31',
                                title: 'A5 Notepad',
                                price: 'Sold out',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/products/IMG_0617_1024x1024@2x.jpg?v=1557218162',
                              ),
                              Product(
                                id: '15',
                                title: 'Classic Sweatshirts – Neutral',
                                price: '£10.99',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/Neutral_-_Sept_24_1024x1024@2x.png?v=1750063651',
                                oldPrice: '£17.00',
                              ),
                              Product(
                                id: '32',
                                title: 'Recycled Notebook',
                                price: '£1.80',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/products/IMG_3406_1024x1024@2x.jpg?v=1581000944',
                              ),
                              Product(
                                id: '33',
                                title: 'iPhone 5/6 Charge & Sync Cable',
                                price: '£1.50',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/products/IMG_0731_1024x1024@2x.jpg?v=1557218844',
                                oldPrice: '£3.00',
                              ),
                              Product(
                                id: '34',
                                title: 'Type C Charge & Sync Cable',
                                price: '£1.50',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/products/IMG_0731_a5c36e1e-fd85-45cc-95d5-e5e17376ec31_1024x1024@2x.jpg?v=1561456690',
                                oldPrice: '£3.00',
                              ),
                              Product(
                                id: '35',
                                title: 'USB to USB Charge & Sync Cables',
                                price: '£1.50',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/products/IMG_0731_8f8e699f-6ffb-4b72-9aba-eafc2865bb20_540x.jpg?v=1557220956',
                                oldPrice: '£3.00',
                              ),
                              Product(
                                id: '36',
                                title: 'Dimple Pop Fidget Keyring',
                                price: '£0.99',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/Fidget_Keyring_1024x1024@2x.png?v=1719226889',
                                oldPrice: '£1.50',
                              ),
                              Product(
                                id: '37',
                                title: 'Nike Academy 18 Tech Pants (W)',
                                price: '£7.00',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/Nike_Pants_Shopify_-_Sept_24_1024x1024@2x.png?v=1726483797',
                                oldPrice: '£24.99',
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('SALE!'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child: const Text('About'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () {}, child: const Text('UPSU.net')),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.person_outline)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
