import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final String username;

  const UserDetailScreen({super.key, required this.username});

  void _handleSignOut(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username: $username',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _handleSignOut(context),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
