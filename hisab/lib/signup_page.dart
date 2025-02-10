import 'package:flutter/material.dart';
import 'package:hisab/auth_provider.dart';
import 'package:hisab/home_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name")),
            TextField(
                controller: mobileController,
                decoration: const InputDecoration(labelText: "Mobile Number")),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signUp(
                    nameController.text,
                    mobileController.text,
                    passwordController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sign-Up Successful!")));

                // Navigate to HomePage after signup
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
