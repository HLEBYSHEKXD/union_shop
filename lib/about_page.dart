import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, this.includeChrome = true});
  final bool includeChrome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (includeChrome) const AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(40),
                    color: Colors.grey[100],
                    child: const Center(
                      child: Text(
                        'About us',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4d2963),
                        ),
                      ),
                    ),
                  ),

                  // Content Section
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to the Union Shop!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    'We\'re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive ',
                              ),
                              TextSpan(
                                text: 'personalisation service',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF4d2963),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      '/product-detail',
                                      arguments: '26',
                                    );
                                  },
                              ),
                              const TextSpan(text: '!'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'All online purchases are available for delivery or instore collection!',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us at hello@upsu.net.',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Happy shopping!',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'The Union Shop & Reception Team',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (includeChrome) const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
