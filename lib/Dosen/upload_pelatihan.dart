import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import '../auth_service.dart';  // Import your AuthService

class PelatihanUploadForm extends StatefulWidget {
  final String jenis;

  const PelatihanUploadForm({super.key, required this.jenis});

  @override
  _PelatihanUploadFormState createState() => _PelatihanUploadFormState();
}

class _PelatihanUploadFormState extends State<PelatihanUploadForm> {
  final _formKey = GlobalKey<FormState>();
  String? _namaSertifikat;
  String? _nomorSertifikat;
  String? _tanggalPelaksanaan;
  String? _tanggalBerlaku;
  String? _namaVendor;
  String? _jenisId;
  List<dynamic> _jenisList = [];
  bool _isLoading = true;
  File? _selectedFile;
  
  final AuthService _authService = AuthService();
  final Dio _dio = Dio(); // Initialize Dio for making HTTP requests
  final String baseUrl = 'http://127.0.0.1:8000/api';  // Set your base URL

  // Existing method to fetch jenis list remains unchanged
  Future<void> _fetchJenisList() async {
    const apiUrl = 'http://127.0.0.1:8000/api/getJenis';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _jenisList = responseData['data'];
          _isLoading = false;
          
          // Optional: Set a default selected value if list is not empty
          if (_jenisList.isNotEmpty) {
            _jenisId = _jenisList[0]['jenis_id'].toString();
          }
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengambil data jenis: ${response.body}')) 
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e'))
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchJenisList(); // Ambil daftar jenis saat halaman dimuat
  }

  // Fungsi untuk memilih file
  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf']);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  // Fungsi untuk menyimpan form
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _selectedFile != null && _jenisId != null) {
      _formKey.currentState!.save();

      // Get token from AuthService
      final token = await _authService.getToken();
      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Token tidak ditemukan'))
        );
        return;
      }

      const apiUrl = "http://127.0.0.1:8000/api/upload_pelatihan";

      try {
        // Prepare request with token and file
        final formData = FormData.fromMap({
          'nama_sertif': _namaSertifikat ?? '',
          'no_sertif': _nomorSertifikat ?? '',
          'tanggal': _tanggalPelaksanaan ?? '',
          'masa_berlaku': _tanggalBerlaku ?? '',
          'jenis_id': _jenisId ?? '',
          'nama_vendor': _namaVendor ?? '',
          'bukti': await MultipartFile.fromFile(_selectedFile!.path),
        });

        // Make the request with token in the header
        final response = await _dio.post(
          apiUrl,
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',  // Include token in header
            },
          ),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data berhasil disimpan')),
          );
          Navigator.pop(context);
        } else {
          final errorMessage = response.data['message'] ?? 'Gagal menyimpan data.';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    } else if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap pilih file terlebih dahulu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form ${widget.jenis}',
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1F4C97),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.jenis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Nama Sertifikat', (value) {
                    _namaSertifikat = value;
                  }),
                  const SizedBox(height: 20),
                  _buildTextField('Nomor sertifikat', (value) {
                    _nomorSertifikat = value;
                  }),
                  const SizedBox(height: 20),
                  _buildTextField('Tanggal', (value) {
                    _tanggalPelaksanaan = value;
                  }),
                  const SizedBox(height: 20),
                  _buildTextField('Tanggal Berlaku', (value) {
                    _tanggalBerlaku = value;
                  }),
                  const SizedBox(height: 20),
                  // Dropdown untuk jenis
                  _buildDropdown(),
                  const SizedBox(height: 20),
                  _buildTextField('Nama vendor', (value) {
                    _namaVendor = value;
                  }),
                  const SizedBox(height: 20),
                  _buildFileUploadButton(),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F4C97),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Pilih Jenis',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      const SizedBox(height: 8),
      _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _jenisList.isEmpty
              ? const Text('Tidak ada data jenis tersedia')
              : DropdownButtonFormField<String>(
                  value: _jenisId,
                  hint: const Text('Pilih Jenis'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Harap pilih jenis';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      _jenisId = newValue;
                    });
                  },
                  items: _jenisList.map<DropdownMenuItem<String>>((jenis) {
                    return DropdownMenuItem<String>(
                      value: jenis['jenis_id'].toString(), 
                      child: Text(jenis['jenis_nama'] ?? 'Nama Tidak Tersedia'),
                    );
                  }).toList(),
                ),
    ],
  );
}

  Widget _buildTextField(String label, Function(String?) onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap isi bidang ini';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildFileUploadButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unggah Berkas',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          icon: const Icon(Icons.cloud_upload, color: Colors.white),
          label: const Text(
            'Tambah Berkas',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: _pickFile,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F4C97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (_selectedFile != null)
          Text(
            'File terpilih: ${_selectedFile!.path.split('/').last}',
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        if (_selectedFile == null)
          const Text(
            'Tidak ada file terpilih',
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
      ],
    );
  }
}
