import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  void _noop() {}

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
                    TextButton(onPressed: _noop, child: const Text('Home')),
                    const SizedBox(width: 8),
                    TextButton(onPressed: _noop, child: const Text('Shop')),
                    const SizedBox(width: 8),
                    TextButton(onPressed: _noop, child: const Text('The Print Shack')),
                    const SizedBox(width: 8),
                    TextButton(onPressed: _noop, child: const Text('SALE!')),
                    const SizedBox(width: 8),
                    TextButton(onPressed: _noop, child: const Text('About')),
                    const SizedBox(width: 8),
                    TextButton(onPressed: _noop, child: const Text('UPSU.net')),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: _noop, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: _noop, icon: const Icon(Icons.person_outline)),
                  IconButton(
                      onPressed: _noop,
                      icon: const Icon(Icons.shopping_bag_outlined)),
                  IconButton(onPressed: _noop, icon: const Icon(Icons.menu)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
