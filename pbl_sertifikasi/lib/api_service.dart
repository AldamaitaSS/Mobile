import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.49:8000/api';

  // Fungsi untuk mengirim data form ke backend
  Future<void> submitCertificationForm(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/upload'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to submit data');
    }
  }
}
