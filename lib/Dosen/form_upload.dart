import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'upload.dart';

class CertificationUploadForm extends StatefulWidget {
  final String jenis;

  CertificationUploadForm({required this.jenis});

  @override
  _CertificationUploadFormState createState() => _CertificationUploadFormState();
}

class _CertificationUploadFormState extends State<CertificationUploadForm> {
  final _formKey = GlobalKey<FormState>();
  String? _nomorSertifikasi;
  String? _tanggalPelaksanaan;
  String? _tanggalBerlaku;
  String? _namaKegiatan;
  String? _namaBidang;
  String? _namaVendor;
  String? _namaFile;

  // Fungsi untuk mengirim data ke API menggunakan MultipartRequest
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final apiUrl = 'http://192.168.1.49:8000/api/create_upload';

      try {
        // Mengambil AuthProvider dan user ID dari context
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final userId = authProvider.user?.id;

        // Tambahkan debug log untuk memastikan user ID ada
        print('User ID dari AuthProvider: $userId');

        if (userId == null) {
          _showDialog(context, 'Error', 'User tidak ditemukan. Silakan login ulang.');
          return;
        }

        var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

        // Menambahkan field data seperti di Postman
        request.fields['user_id'] = userId.toString();
        request.fields['no_sertif'] = _nomorSertifikasi ?? '';
        request.fields['nama_sertif'] = _namaKegiatan ?? '';
        request.fields['tanggal_pelaksanaan'] = _tanggalPelaksanaan ?? '';
        request.fields['tanggal_berlaku'] = _tanggalBerlaku ?? '';
        request.fields['bidang_id'] = _namaBidang ?? '';
        request.fields['nama_vendor'] = _namaVendor ?? '';

        // Menambahkan file jika ada
        if (_namaFile != null) {
          var file = await http.MultipartFile.fromPath('image', _namaFile!);
          request.files.add(file);
        }

        // Mengirim request
        var response = await request.send();

        if (response.statusCode == 201) {
          _showDialog(context, 'Sukses', 'Data berhasil disimpan!');
        } else {
          print('Status Code: ${response.statusCode}');
          print('Response Body: ${await response.stream.bytesToString()}');
          _showDialog(context, 'Error', 'Gagal menyimpan data. Status: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
        _showDialog(context, 'Error', 'Terjadi kesalahan. Silakan coba lagi.');
      }
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form ${widget.jenis}', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFF1F4C97),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(widget.jenis, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20),
                    _buildTextField('Nomor ${widget.jenis}', (value) => _nomorSertifikasi = value),
                    _buildTextField('Tanggal Pelaksanaan', (value) => _tanggalPelaksanaan = value),
                    _buildTextField('Tanggal Berlaku', (value) => _tanggalBerlaku = value),
                    _buildTextField('Nama Kegiatan', (value) => _namaKegiatan = value),
                    _buildTextField('Bidang', (value) => _namaBidang = value),
                    _buildTextField('Nama Vendor', (value) => _namaVendor = value),
                    _buildFileUploadButton(context),
                    Spacer(),
                    SizedBox(height: 40),
                    _buildSaveButton(context),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onSaved: onSaved,
          validator: (value) => value == null || value.isEmpty ? 'Harap isi bidang ini' : null,
        ),
      ],
    );
  }

  Widget _buildFileUploadButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Unggah Berkas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ElevatedButton.icon(
          icon: Icon(Icons.cloud_upload, color: Colors.white),
          label: Text('Tambah Berkas', style: TextStyle(color: Colors.white)),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadScreen(
                onFileUploaded: (String fileName) => setState(() => _namaFile = fileName),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1F4C97),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          _namaFile != null ? 'File terpilih: $_namaFile' : 'Tidak ada file terpilih',
          style: TextStyle(fontSize: 16, color: _namaFile == null ? Colors.red : Colors.black),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ElevatedButton(
          onPressed: _submitForm,
          child: Text('Simpan', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1F4C97),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}
