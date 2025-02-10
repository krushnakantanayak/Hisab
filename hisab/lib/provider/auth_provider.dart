import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isSignUp = false;
  String _userName = "";

  bool get isAuthenticated => _isAuthenticated;
  bool get isSignUp => _isSignUp;
  String get userName => _userName;

  void signUp(String name, String mobile, String password) {
    _isSignUp = false;
    _isAuthenticated = true;
    _userName = name;
    notifyListeners();
  }

  void login(String name, String password) {
    _isAuthenticated = true;
    _userName = name;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _userName = "";
    notifyListeners();
  }
}
