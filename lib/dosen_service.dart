import 'dart:convert';
import 'package:http/http.dart' as http;

class DosenService {
  final String baseUrl = "http://localhost/db_sertifikasi"; // Sesuaikan dengan URL server

  Future<List<dynamic>> getDosen() async {
    final response = await http.get(Uri.parse('$baseUrl/get_dosen.php'));

    if (response.statusCode == 200) {
      return json.decode(response.body); // Mengembalikan data dalam format JSON
    } else {
      throw Exception('Gagal mengambil data dosen');
    }
  }

  Future<void> addDosen(String nama, String nip) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_dosen.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nama': nama,
        'nip': nip,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menambahkan dosen');
    }
  }
}
