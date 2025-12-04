import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';

void main() {
  testWidgets('Auth page shows tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));
    await tester.pump();
    expect(
        find.descendant(of: find.byType(TabBar), matching: find.text('Login')),
        findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(TabBar), matching: find.text('Sign Up')),
        findsOneWidget);
  });

  testWidgets('Login tab shows email, password, forgot, and login button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));
    await tester.pump();
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });

  testWidgets('Sign Up tab shows expected fields and create account button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));
    await tester.pump();
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('Full name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm password'), findsOneWidget);
    expect(find.text('I agree to the Terms & Conditions'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.text('Create account'), findsOneWidget);
  });
}
