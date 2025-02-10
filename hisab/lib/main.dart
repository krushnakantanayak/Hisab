import 'package:flutter/material.dart';
import 'package:hisab/provider/auth_provider.dart';
import 'package:hisab/pages/home_page.dart';
import 'package:hisab/provider/calculator_provider.dart';

import 'package:hisab/pages/login_page.dart';
import 'package:hisab/provider/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
      ],
      child: const Hisab(),
    ),
  );
}

class Hisab extends StatelessWidget {
  const Hisab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hisab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return authProvider.isAuthenticated
              ? const HomePage()
              : const LoginPage();
        },
      ),
    );
  }
}
