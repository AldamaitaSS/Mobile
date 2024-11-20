import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  // Method untuk set data user setelah login berhasil
  Future<void> setLoginData({required int userId, required String token, String? name}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
    await prefs.setString('token', token);
    
    _user = User(
      id: userId,
      name: name ?? ''  // Berikan default empty string jika name null
    );
    _token = token;
    notifyListeners();
  }

  // Method untuk cek apakah user sudah login
  bool get isLoggedIn => _user != null && _token != null;

  // Method untuk load data user saat aplikasi dibuka
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final savedToken = prefs.getString('token');
    final userName = prefs.getString('name');

    if (userId != null && savedToken != null) {
      _user = User(
        id: userId,
        name: userName ?? ''
      );
      _token = savedToken;
      notifyListeners();
    }

    print('User ID: $_user.id');
    print('Token: $_token');
  }



  // Method untuk logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _user = null;
    _token = null;
    notifyListeners();
  }
}