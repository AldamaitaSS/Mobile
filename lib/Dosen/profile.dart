import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'package:dio/dio.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api';
  final AuthService _authService = AuthService();

  String? _nama;
  String? _email;
  String? _username;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Debug: Print untuk mengecek eksekusi
      print('Loading user profile...');

      final token = await _authService.getToken();
      print('Token: $token'); // Debug token

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await _dio.get(
        '$baseUrl/user',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          validateStatus: (status) {
            print('Response status: $status'); // Debug status code
            return true; // Accept any status code for debugging
          },
        ),
      );

      // Debug: Print response
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final userData = response.data['user'];
        print('User data: $userData'); // Debug user data

        setState(() {
          _nama = userData['nama'];
          _email = userData['email'];
          _username = userData['username'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error detail: $e'); // Debug error
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memuat data profil: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1F4C97),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadUserProfile,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        _nama ?? 'Tidak ada data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30),
                      _buildProfileField(
                        "Email",
                        _email ?? 'Tidak ada data',
                        Icons.email,
                      ),
                      SizedBox(height: 20),
                      _buildProfileField(
                        "Nama Pengguna",
                        _username ?? 'Tidak ada data',
                        null,
                      ),
                      if (_error != null) ...[
                        SizedBox(height: 20),
                        Text(
                          'Error: $_error',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigasi ke EditProfileScreen akan diimplementasikan nanti
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1F4C97),
                          ),
                          child: Text(
                            "EDIT",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildProfileField(String label, String value, IconData? icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 10),
                Icon(icon, color: Colors.black54),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
