import 'package:flutter/material.dart';
import 'package:hisab/auth_provider.dart';
import 'package:hisab/calculator/calculator_provider.dart';
import 'package:hisab/home_page.dart';
import 'package:hisab/login_page.dart';
import 'package:hisab/todo/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth App',
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
