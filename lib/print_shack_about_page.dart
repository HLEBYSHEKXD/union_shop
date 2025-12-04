import 'package:flutter/material.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/footer.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key, this.includeChrome = true});
  final bool includeChrome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (includeChrome) const AppHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Centered page title
                const Center(
                  child: Text(
                    'The Union Print Shack',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/graduation_hoodie_hero.jpg',
                          height: 220,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                          // In tests, avoid network fetch work by showing empty box.
                          // You can also gate this by includeChrome if desired.
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/print_shack_logo_tile.jpg',
                          height: 220,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/your_name_here_hood.jpg',
                          height: 220,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Make It Yours at The Union Print Shack',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Want to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. '
                  'Swing by the shop – our team’s always happy to help you pick the right gear and answer any questions.',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Uni Gear or Your Gear – We’ll Personalise It',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Whether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. '
                  'We can personalise official uni-branded clothing and your own items – just bring them in and let’s get creative!',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Simple Pricing, No Surprises',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Customising your gear won’t break the bank – just £3 for one line of text or a small chest logo, '
                  'and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),

                // Added sections from your screenshot
                const SizedBox(height: 32),
                const Text(
                  'Personalisation Terms & Conditions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'We will print your clothing exactly as you have provided it to us, whether online or in person. '
                  'We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. '
                  'Refunds are not provided for any personalised items.',
                  style: TextStyle(
                      fontSize: 14, height: 1.5, color: Colors.black87),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Ready to Make It Yours?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pop in or get in touch today – let’s create something uniquely you with our personalisation service – The Union Print Shack!',
                  style: TextStyle(
                      fontSize: 14, height: 1.5, color: Colors.black87),
                ),
              ],
            ),
          ),
          if (includeChrome) const AppFooter(),
        ],
      ),
    );
  }
}
