import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Sign Up'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _LoginForm(),
            _SignupForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextField(
            decoration: InputDecoration(
                labelText: 'Email', border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
                labelText: 'Password', border: OutlineInputBorder()),
            obscureText: true,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {}, child: const Text('Forgot password?')),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextField(
              decoration: InputDecoration(
                  labelText: 'Full name', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
                labelText: 'Email', border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
                labelText: 'Password', border: OutlineInputBorder()),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
                labelText: 'Confirm password', border: OutlineInputBorder()),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(value: false, onChanged: (_) {}),
              const Expanded(
                  child: Text('I agree to the Terms & Conditions',
                      softWrap: true)),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
            ),
            child: const Text('Create account'),
          ),
        ],
      ),
    );
  }
}
