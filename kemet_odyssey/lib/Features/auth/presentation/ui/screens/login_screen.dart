import 'package:flutter/material.dart';

/// Placeholder sign-in screen; replace with real login UI + Cubit.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Center(
        child: Text('Sign in — coming soon'),
      ),
    );
  }
}
