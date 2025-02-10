import 'package:flutter/material.dart';
import 'package:hisab/provider/auth_provider.dart';
import 'package:hisab/pages/login_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${authProvider.userName}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Clear user session (if using Provider or SharedPreferences, clear it here)

                // Navigate to Login Page and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) =>
                      false, // This removes all previous routes from the stack
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
