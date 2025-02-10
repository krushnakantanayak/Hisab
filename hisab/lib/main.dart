import 'package:flutter/material.dart';
import 'package:hisab/calculator/calculator_provider.dart';
import 'package:hisab/home_page.dart';
import 'package:hisab/todo/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TaskCalcApp());
}

class TaskCalcApp extends StatelessWidget {
  const TaskCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TaskCalc',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
