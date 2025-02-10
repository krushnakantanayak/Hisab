import 'package:flutter/material.dart';
import 'package:hisab/bottom_nav_bar.dart';
import 'package:hisab/profile_page.dart';
import 'todo/todo_page.dart';
import 'pages/calculator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ProfilePage(), // First Page (Profile Page)
    const TodoPage(),
    const CalculatorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabSelected: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
