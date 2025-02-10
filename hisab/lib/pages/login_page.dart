import 'package:flutter/material.dart';
import 'package:hisab/auth/auth_provider.dart';
import 'package:hisab/home_page.dart';

import 'package:provider/provider.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Provider.of<AuthProvider>(context) is used to access an instance of AuthProvider
                // listen: false means we are only calling a method (login) and don’t need to rebuild the widget.
                Provider.of<AuthProvider>(context, listen: false)
                    .login(nameController.text, passwordController.text);

                // Navigate to HomePage after login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const Text("New? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
