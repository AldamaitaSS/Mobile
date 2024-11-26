// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthService {
//   final String baseUrl = 'http://127.0.0.1:8000/api';

//   Future<Map<String, dynamic>?> login(String username, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/login'),
//         headers: {
//           'Accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'username': username,
//           'password': password,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         if (data['success'] == true) {
//           final prefs = await SharedPreferences.getInstance();
//           await prefs.setString('token', data['token']);
//           await prefs.setString('user_id', data['user']['user_id'].toString());
//           await prefs.setString('username', data['user']['username']);
//           await prefs.setString('nama', data['user']['nama']);
//           await prefs.setInt('level_id', data['user']['level']['id']);
//           await prefs.setString('level_kode', data['user']['level']['kode']);

//           return data;
//         }
//       }
//       print('Login failed with status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       return null;
//     } catch (e) {
//       print('Error during login: $e');
//       return null;
//     }
//   }

//   Future<bool> logout() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.clear();
//       return true;
//     } catch (e) {
//       print('Error during logout: $e');
//       return false;
//     }
//   }

//   Future<bool> isLoggedIn() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString('token') != null;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<Map<String, dynamic>> getUserData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return {
//         'user_id': prefs.getString('user_id'),
//         'username': prefs.getString('username'),
//         'nama': prefs.getString('nama'),
//         'level_id': prefs.getInt('level_id'),
//         'level_kode': prefs.getString('level_kode'),
//       };
//     } catch (e) {
//       return {};
//     }
//   }

//   Future<void> storeToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('jwt_token', token);
//   }

//   // Ambil token dari shared preferences
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('jwt_token');
//   }

//   // Hapus token (untuk logout)
//   Future<void> removeToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('jwt_token');
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<Map<String, dynamic>?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['success'] == true) {
          final prefs = await SharedPreferences.getInstance();
          // Simpan dengan key yang konsisten
          await prefs.setString('token', data['token']);
          await prefs.setString('user_id', data['user']['user_id'].toString());
          await prefs.setString('username', data['user']['username']);
          await prefs.setString('nama', data['user']['nama']);
          await prefs.setInt('level_id', data['user']['level']['id']);
          await prefs.setString('level_kode', data['user']['level']['kode']);

          return data;
        }
      }
      print('Login failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  // Gunakan key 'token' yang konsisten
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      return true;
    } catch (e) {
      print('Error during logout: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return {
        'token': prefs.getString('token'),
        'user_id': prefs.getString('user_id'),
        'username': prefs.getString('username'),
        'nama': prefs.getString('nama'),
        'level_id': prefs.getInt('level_id'),
        'level_kode': prefs.getString('level_kode'),
      };
    } catch (e) {
      return {};
    }
  }
}
