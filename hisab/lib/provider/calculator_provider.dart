import 'package:flutter/material.dart';
import 'package:hisab/calculator/model/%20item_model.dart';

class CalculatorProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(String name, double price) {
    _items.add(Item(name: name, price: price));
    notifyListeners();
  }

  void updateItemPrice(int index, double price) {
    _items[index].price = price;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get totalAmount => _items.fold(0, (sum, item) => sum + item.price);
}
