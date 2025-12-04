# Union Shop (Flutter)

A Flutter web app recreating the Union Shop experience with a focus on mobile-first UI, navigation, and widget testing. This repo includes static pages (Home, About, Print Shack), product lists, product detail scaffolding, header/footer, and an authentication UI (Login/Sign Up).

## Quick Start

- Prerequisites: Flutter 3.x, Chrome, VS Code (or preferred editor)
- Install dependencies:
  ```bash
  flutter pub get
  ```
- Run (web, Chrome):
  ```bash
  flutter run -d chrome
  ```
- Format:
  ```bash
  flutter format .
  ```

## Project Structure

```plaintext
union_shop/
├── lib/
│   ├── main.dart                    # App entry, home screen, routing
│   ├── header.dart                  # Top navigation/header (Wrap navigation)
│   ├── footer.dart                  # Footer (links/info)
│   ├── about_page.dart              # About us page
│   ├── print_shack_about_page.dart  # Print Shack info page
│   ├── product_list_page.dart       # Product list (args-driven)
│   ├── product_detail_page.dart     # Product detail scaffold
│   ├── auth_page.dart               # Login/Sign Up UI (tabs)
│   └── ...other UI helpers...
├── test/
│   ├── header_test.dart
│   ├── about_page_test.dart
│   ├── print_shack_about_page_test.dart
│   ├── auth_page_test.dart
│   └── ...additional widget tests...
├── pubspec.yaml
└── README.md
```

## Routes

- /               HomeScreen
- /about          AboutPage
- /products       ProductListPage (expects ProductListArgs)
- /product-detail ProductDetailPage (expects product id)
- /auth           AuthPage (Login/Sign Up)

You can navigate via:
- Header buttons (Home, SALE!, About, Print Shack menu)
- Grid/category tiles on the home page
- Person icon in header → /auth

## Key Features

- Header with sale banner and responsive nav (uses Wrap to avoid overflow)
- Footer shared across pages
- Home page with:
  - Carousel-style hero (PageView with overlay text and CTA)
  - Essential and Signature product grids
  - Portsmouth City collection preview + “VIEW ALL” navigation
  - Category tiles with navigation (e.g., Clothing, Merchandise, Graduation, SALE)
- About page with rich text and tappable “personalisation service”
- Print Shack info page with sections and images
- Auth page with tabs:
  - Login: Email, Password, Forgot password?, Login button
  - Sign Up: Name, Email, Password, Confirm, T&C checkbox, Create account

Note: Widgets/forms are UI-only; business logic and services are out of scope.

## Testing

Run tests:
```bash
flutter test
```

Included tests:
- header_test.dart
  - Verifies banner text and navigation icons exist
- about_page_test.dart
  - Validates hero title, key copy, and rich text presence
- print_shack_about_page_test.dart
  - Checks section titles, pricing mentions, and terms
- auth_page_test.dart
  - Confirms tabs exist, login fields, and signup fields after tab switch

Testing notes:
- Use single `pump()` to avoid indefinite `pumpAndSettle()` with animated widgets
- Some page tests instantiate pages with `includeChrome: false` (to exclude header/footer for stability)
- Images use errorBuilder for robustness

## Data Structures

ProductListPage uses:
- ProductListArgs: pageTitle, heroImageUrl, introText?, products[]
- Product: id, title, price, imageUrl, oldPrice?

These are passed via `Navigator.pushNamed` arguments in multiple places (header, tiles, buttons).

## Development Tips

- Stick to mobile-first view; test using Chrome DevTools device toolbar
- Avoid network/image errors in tests by relying on `errorBuilder` and minimal pumps
- Keep commits small and descriptive
- Use constants and helper widgets to reduce duplication
- Prefer Wrap/Flex/Expanded to prevent overflow in constrained layouts

## Contributing

- Format and lint before committing
- Write/adjust widget tests for new UI
- Keep routes stable and document changes here
- Do not include copyrighted images/assets; use placeholders or open-license sources

## License

This coursework code is provided for educational purposes. Ensure your fork adheres to your module’s academic integrity policies. External service integrations (e.g., Firebase) must be documented and attributed appropriately.
