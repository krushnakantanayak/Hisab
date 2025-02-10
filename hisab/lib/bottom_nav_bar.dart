import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.check), label: 'To-Do'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calculate), label: 'Calculator'),
      ],
    );
  }
}
