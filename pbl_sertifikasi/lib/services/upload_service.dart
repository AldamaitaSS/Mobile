import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

class UploadService {
  static Future<void> uploadData({
    required String url,
    required Map<String, String> fields,
    required String? filePath,
  }) async {
    // Buat FormData untuk web
    final formData = html.FormData();
    
    // Tambahkan semua field
    fields.forEach((key, value) {
      formData.append(key, value);
    });

    // Handle file upload untuk web
    if (filePath != null) {
      final blob = html.Blob([filePath]);
      formData.append('image', blob, 'image.jpg');
    }

    try {
      final request = await http.post(
        Uri.parse(url),
        body: formData,
        headers: {
          'Accept': 'application/json',
        },
      );

      if (request.statusCode != 201) {
        throw Exception('Failed to upload');
      }
    } catch (e) {
      throw Exception('Error uploading: $e');
    }
  }
}