import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart'; // Import ApiService

class CertificationUploadForm extends StatefulWidget {
  final String jenis;

  CertificationUploadForm({required this.jenis});

  @override
  _CertificationUploadFormState createState() => _CertificationUploadFormState();
}

class _CertificationUploadFormState extends State<CertificationUploadForm> {
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  String? _nomorSertifikasi;
  String? _tanggalPelaksanaan;
  String? _tanggalBerlaku;
  String? _namaKegiatan;
  String? _namaBidang;
  String? _namaVendor;
  String? _namaFile;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final data = {
        'nomorSertifikasi': _nomorSertifikasi,
        'tanggalPelaksanaan': _tanggalPelaksanaan,
        'tanggalBerlaku': _tanggalBerlaku,
        'namaKegiatan': _namaKegiatan,
        'namaBidang': _namaBidang,
        'namaVendor': _namaVendor,
        'namaFile': _namaFile,
      };

      try {
        await apiService.submitCertificationForm(data);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sukses'),
              content: Text('Data berhasil disimpan!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Gagal menyimpan data.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  // Panggil _submitForm di tombol Simpan
  Widget _buildSaveButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ElevatedButton(
          onPressed: _submitForm, // Panggil _submitForm saat tombol ditekan
          child: Text(
            'Simpan',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1F4C97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Upload Sertifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nomor Sertifikasi'),
                onSaved: (value) => _nomorSertifikasi = value,
                validator: (value) => value!.isEmpty ? 'Harap isi nomor sertifikasi' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal Pelaksanaan'),
                onSaved: (value) => _tanggalPelaksanaan = value,
                validator: (value) => value!.isEmpty ? 'Harap isi tanggal pelaksanaan' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal Berlaku'),
                onSaved: (value) => _tanggalBerlaku = value,
                validator: (value) => value!.isEmpty ? 'Harap isi tanggal berlaku' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Kegiatan'),
                onSaved: (value) => _namaKegiatan = value,
                validator: (value) => value!.isEmpty ? 'Harap isi nama kegiatan' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Bidang'),
                onSaved: (value) => _namaBidang = value,
                validator: (value) => value!.isEmpty ? 'Harap isi nama bidang' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Vendor'),
                onSaved: (value) => _namaVendor = value,
                validator: (value) => value!.isEmpty ? 'Harap isi nama vendor' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama File'),
                onSaved: (value) => _namaFile = value,
                validator: (value) => value!.isEmpty ? 'Harap isi nama file' : null,
              ),
              SizedBox(height: 20),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
