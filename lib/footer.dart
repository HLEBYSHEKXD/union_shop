import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  void _noop() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          // Top section with 3 columns
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Column 1: Opening Hours
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Opening Hours',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '❄️ Winter Break Closure Dates ❄️',
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Closing 4pm 19/12/2025',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Reopening 10am 05/01/2026',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Last post date: 12pm on 18/12/2025',
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '-----------------------',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '(Term Time)',
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Monday - Friday 10am - 4pm',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '(Outside of Term Time / Consolidation Weeks)',
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Monday - Friday 10am - 3pm',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Purchase online 24/7',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Column 2: Help and Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Help and Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _noop,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: _noop,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Text(
                        'Terms & Conditions of Sale Policy',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Column 3: Latest Offers
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Latest Offers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Email address',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _noop,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'SUBSCRIBE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Bottom section: Social icons, payment methods, copyright
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: _noop,
                  icon: const Icon(Icons.facebook, size: 32),
                  color: Colors.black),
              const SizedBox(width: 16),
              IconButton(
                  onPressed: _noop,
                  icon: const Icon(Icons.message, size: 32),
                  color: Colors.black),
              const Spacer(),
              // Payment methods image from assets
              SizedBox(
                height: 40,
                child: Image.asset(
                  'assets/images/payment_method.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              Text('© 2025, ',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('upsu-store',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(' Powered by Shopify',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
