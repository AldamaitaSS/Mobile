<<<<<<< HEAD
// import 'package:flutter/material.dart';
// import 'upload.dart'; // Pastikan ini adalah path ke file yang berisi UploadScreen

// class CertificationUploadForm extends StatefulWidget {
//   final String jenis; // Tambahkan parameter 'jenis'

//   // Constructor untuk menerima parameter 'jenis'
//   CertificationUploadForm({required this.jenis});

//   @override
//   _CertificationUploadFormState createState() => _CertificationUploadFormState();
// }

// class _CertificationUploadFormState extends State<CertificationUploadForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? _nomorSertifikasi;
//   String? _tanggalPelaksanaan;
//   String? _tanggalBerlaku;
//   String? _namaKegiatan;
//   String? _namaFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Form ${widget.jenis}', // Mengganti judul berdasarkan jenis yang dipilih
//           style: TextStyle(color: Colors.white), // Warna teks putih
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white), // Warna ikon tombol back putih
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Color(0xFF1F4C97),
//       ),
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height, // Membuat container minimal setinggi layar
//           ),
//           child: IntrinsicHeight( // Agar container mengisi penuh tinggi layar
//             child: Container(
//               color: Colors.white, // Latar belakang putih
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         widget.jenis, // Menampilkan jenis unggahan di tengah
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField('Nomor ${widget.jenis}', (value) {
//                       _nomorSertifikasi = value;
//                     }),
//                     SizedBox(height: 20),
//                     _buildTextField('Tanggal Pelaksanaan', (value) {
//                       _tanggalPelaksanaan = value;
//                     }),
//                     SizedBox(height: 20),
//                     _buildTextField('Tanggal Berlaku', (value) {
//                       _tanggalBerlaku = value;
//                     }),
//                     SizedBox(height: 20),
//                     _buildTextField('Nama Kegiatan', (value) {
//                       _namaKegiatan = value;
//                     }),
//                     SizedBox(height: 20),
//                     _buildFileUploadButton(context), // Kirim context untuk navigasi
//                     Spacer(), // Menambahkan spacer agar tombol simpan ada di bagian bawah
//                     SizedBox(height: 20), // Memberikan jarak antara isian form dan tombol
//                     _buildSaveButton(context), // Tombol Simpan
//                     SizedBox(height: 50), // Menambahkan sedikit jarak dari bawah layar
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, Function(String?) onSaved) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         TextFormField(
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey[200],
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//           ),
//           onSaved: onSaved,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Harap isi bidang ini';
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildFileUploadButton(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Unggah Berkas',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         ElevatedButton.icon(
//           icon: Icon(Icons.cloud_upload, color: Colors.white),
//           label: Text(
//             'Tambah Berkas',
//             style: TextStyle(color: Colors.white),
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => UploadScreen(
//                   onFileUploaded: (String fileName) {
//                     setState(() {
//                       _namaFile = fileName; // Update _namaFile setelah upload
//                     });
//                   },
//                 ),
//               ),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color(0xFF1F4C97),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         if (_namaFile != null)
//           Text(
//             'File terpilih: $_namaFile',
//             style: TextStyle(fontSize: 16),
//           ),
//         if (_namaFile == null)
//           Text(
//             'Tidak ada file terpilih',
//             style: TextStyle(fontSize: 16, color: Colors.red),
//           ),
//       ],
//     );
//   }

//   Widget _buildSaveButton(BuildContext context) {
//     return Center( // Agar tombol berada di tengah
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.5, // Lebar tombol 50% dari lebar layar
//         child: ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               _formKey.currentState!.save();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Form berhasil disimpan')),
//               );
//             }
//           },
//           child: Text(
//             'Simpan',
//             style: TextStyle(color: Colors.white), // Teks putih
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color(0xFF1F4C97),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 16), // Menambah padding vertikal
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'upload.dart';
import '../auth_service.dart';

class CertificationUploadForm extends StatefulWidget {
  final String jenis;

  const CertificationUploadForm({Key? key, required this.jenis})
      : super(key: key);

  @override
  _CertificationUploadFormState createState() =>
      _CertificationUploadFormState();
}

class _CertificationUploadFormState extends State<CertificationUploadForm> {
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api';
  final _formKey = GlobalKey<FormState>();
  bool _sedangMemuat = false;

  // Data form
  String? _nomorSertifikasi;
  DateTime? _tanggalPelaksanaan;
  DateTime? _tanggalBerlaku;
  String? _namaKegiatan;
  String? _bidangId;
  String? _vendorId;
  String? _namaFile;

  // Data dropdown
  List<Map<String, dynamic>> _daftarBidang = [];
  List<Map<String, dynamic>> _daftarVendor = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _ambilDataDropdown();
      }
    });
  }

  Future<void> _pilihTanggal(BuildContext context, bool isPelaksanaan) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null &&
        picked != (isPelaksanaan ? _tanggalPelaksanaan : _tanggalBerlaku)) {
      setState(() {
        if (isPelaksanaan) {
          _tanggalPelaksanaan = picked;
        } else {
          _tanggalBerlaku = picked;
        }
      });
    }
  }

  Future<void> _ambilDataDropdown() async {
    if (!mounted) return;

    setState(() => _sedangMemuat = true);

    try {
      print('=== Debug Request ===');
      print('Base URL: $baseUrl');

      // Cek token JWT jika ada
      final authService = AuthService();
      final token = await authService.getToken();
      print('Token: $token');

      final responseBidang = await _dio.get(
        '$baseUrl/bidang',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': token != null ? 'Bearer $token' : '',
          },
          validateStatus: (status) {
            print('Status Code: $status');
            return true; // Accept any status code for debugging
          },
        ),
      );

      print('Response Bidang Data: ${responseBidang.data}');

      if (responseBidang.statusCode == 200) {
        setState(() {
          _daftarBidang = List<Map<String, dynamic>>.from(
              responseBidang.data['data']?.map((item) => {
                        'id': item['bidang_id']?.toString() ?? '',
                        'name': item['bidang_nama'] ?? '',
                      }) ??
                  []);
        });
        print('Daftar Bidang: $_daftarBidang');
      } else {
        print('Error Response: ${responseBidang.data}');
      }

      // Lakukan hal yang sama untuk vendor
      final responseVendor = await _dio.get(
        '$baseUrl/vendor',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': token != null ? 'Bearer $token' : '',
          },
          validateStatus: (status) {
            print('Vendor Status Code: $status');
            return true;
          },
        ),
      );

      print('Response Vendor Data: ${responseVendor.data}');

      if (responseVendor.statusCode == 200) {
        setState(() {
          _daftarVendor = List<Map<String, dynamic>>.from(
              responseVendor.data['data']?.map((item) => {
                        'id': item['vendor_id']?.toString() ?? '',
                        'name': item['vendor_nama'] ?? '',
                      }) ??
                  []);
        });
        print('Daftar Vendor: $_daftarVendor');
      } else {
        print('Error Response Vendor: ${responseVendor.data}');
      }
    } catch (e) {
      print('=== Error Details ===');
      print('Error Type: ${e.runtimeType}');
      print('Error Message: $e');
      if (e is DioException) {
        print('Response Data: ${e.response?.data}');
        print('Response Headers: ${e.response?.headers}');
        print('Request Options: ${e.requestOptions.toString()}');
      }
      _tampilkanPesan('Gagal memuat data: $e');
    } finally {
      if (mounted) {
        setState(() => _sedangMemuat = false);
      }
    }
  }

  Future<void> _kirimForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sedangMemuat = true);
    _formKey.currentState!.save();

    try {
      final authService = AuthService();
      final userData = await authService.getUserData();
      final userToken = userData['token'];
      final userId = userData['user_id'];

      if (userToken == null || userId == null) {
        throw Exception('Silakan login ulang');
      }

      // Perbaikan tipe data Map
      final formData = {
        "user_id": userId.toString(),
        "no_sertif":
            _nomorSertifikasi ?? '', // Nilai default empty string jika null
        "nama_sertif": _namaKegiatan ?? '',
        "tanggal_pelaksanaan": _tanggalPelaksanaan != null
            ? "${_tanggalPelaksanaan!.year}-${_tanggalPelaksanaan!.month.toString().padLeft(2, '0')}-${_tanggalPelaksanaan!.day.toString().padLeft(2, '0')}"
            : '',
        "tanggal_berlaku": _tanggalBerlaku != null
            ? "${_tanggalBerlaku!.year}-${_tanggalBerlaku!.month.toString().padLeft(2, '0')}-${_tanggalBerlaku!.day.toString().padLeft(2, '0')}"
            : '',
        "bidang_id": _bidangId?.toString() ?? '',
        "vendor_id": _vendorId?.toString() ?? '',
      };

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/uploads'),
      )
        ..headers['Authorization'] = 'Bearer $userToken'
        ..headers['Accept'] = 'application/json'
        ..fields.addAll(
            formData); // Sekarang formData sudah bertype Map<String, String>

      if (_namaFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath('file_sertif', _namaFile!),
        );
      }

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final decodedResponse = json.decode(responseData);

      if (response.statusCode == 201) {
        _tampilkanPesan('Data berhasil disimpan!', isError: false);
        _formKey.currentState?.reset();
        setState(() {
          _nomorSertifikasi = null;
          _tanggalPelaksanaan = null;
          _tanggalBerlaku = null;
          _namaKegiatan = null;
          _bidangId = null;
          _vendorId = null;
          _namaFile = null;
        });
      } else {
        _tampilkanPesan(decodedResponse['message'] ?? 'Gagal menyimpan data');
      }
    } catch (e) {
      _tampilkanPesan('Terjadi kesalahan: $e');
    } finally {
      setState(() => _sedangMemuat = false);
    }
  }

  void _tampilkanPesan(String pesan, {bool isError = true}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

=======
import 'package:flutter/material.dart';
import 'upload.dart'; // Pastikan ini adalah path ke file yang berisi UploadScreen

class CertificationUploadForm extends StatefulWidget {
  final String jenis; // Tambahkan parameter 'jenis'
  
  // Constructor untuk menerima parameter 'jenis'
  const CertificationUploadForm({super.key, required this.jenis});

  @override
  _CertificationUploadFormState createState() => _CertificationUploadFormState();
}

class _CertificationUploadFormState extends State<CertificationUploadForm> {
  final _formKey = GlobalKey<FormState>();
  String? _nomorSertifikasi;
  String? _tanggalPelaksanaan;
  String? _tanggalBerlaku;
  String? _namaKegiatan;
  String? _namaFile;

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title:
            Text('Form ${widget.jenis}', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFF1F4C97),
      ),
      body: _sedangMemuat
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
=======
        title: Text(
          'Form ${widget.jenis}', // Mengganti judul berdasarkan jenis yang dipilih
          style: const TextStyle(color: Colors.white), // Warna teks putih
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Warna ikon tombol back putih
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1F4C97),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height, // Membuat container minimal setinggi layar
          ),
          child: IntrinsicHeight( // Agar container mengisi penuh tinggi layar
            child: Container(
              color: Colors.white, // Latar belakang putih
              padding: const EdgeInsets.all(16.0),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< HEAD
                    _bangunJudulForm(),
                    _bangunInputTeks(
                      'Nomor Sertifikasi',
                      (value) => _nomorSertifikasi = value,
                    ),
                    _bangunInputTanggal(
                      'Tanggal Pelaksanaan',
                      _tanggalPelaksanaan,
                      () => _pilihTanggal(context, true),
                    ),
                    _bangunInputTanggal(
                      'Tanggal Berlaku',
                      _tanggalBerlaku,
                      () => _pilihTanggal(context, false),
                    ),
                    _bangunInputTeks(
                      'Nama Kegiatan',
                      (value) => _namaKegiatan = value,
                    ),
                    _bangunDropdown(
                      'Pilih Bidang',
                      _daftarBidang,
                      (value) => setState(() => _bidangId = value),
                    ),
                    _bangunDropdown(
                      'Pilih Vendor',
                      _daftarVendor,
                      (value) => setState(() => _vendorId = value),
                      wajibDiisi: false,
                    ),
                    _bangunTombolUnggah(),
                    _bangunTombolKirim(),
=======
                    Center(
                      child: Text(
                        widget.jenis, // Menampilkan jenis unggahan di tengah
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('Nomor ${widget.jenis}', (value) {
                      _nomorSertifikasi = value;
                    }),
                    const SizedBox(height: 20),
                    _buildTextField('Tanggal Pelaksanaan', (value) {
                      _tanggalPelaksanaan = value;
                    }),
                    const SizedBox(height: 20),
                    _buildTextField('Tanggal Berlaku', (value) {
                      _tanggalBerlaku = value;
                    }),
                    const SizedBox(height: 20),
                    _buildTextField('Nama Kegiatan', (value) {
                      _namaKegiatan = value;
                    }),
                    const SizedBox(height: 20),
                    _buildFileUploadButton(context), // Kirim context untuk navigasi
                    const Spacer(), // Menambahkan spacer agar tombol simpan ada di bagian bawah
                    const SizedBox(height: 20), // Memberikan jarak antara isian form dan tombol
                    _buildSaveButton(context), // Tombol Simpan
                    const SizedBox(height: 50), // Menambahkan sedikit jarak dari bawah layar
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  ],
                ),
              ),
            ),
<<<<<<< HEAD
    );
  }

  Widget _bangunJudulForm() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          widget.jenis,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
=======
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _bangunInputTeks(String label, Function(String?) onSaved) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onSaved: onSaved,
            validator: (value) =>
                value?.isEmpty ?? true ? 'Harap isi field ini' : null,
          ),
        ],
      ),
    );
  }

  Widget _bangunInputTanggal(
      String label, DateTime? tanggal, Function() onTap) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tanggal != null
                        ? "${tanggal.day.toString().padLeft(2, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.year}"
                        : 'Pilih Tanggal',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bangunDropdown(
    String label,
    List<Map<String, dynamic>> opsi,
    Function(String?) onChanged, {
    bool wajibDiisi = true,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            isExpanded: true,
            hint: Text('Pilih ${label.toLowerCase()}'),
            value: label.contains('Bidang') ? _bidangId : _vendorId,
            items: [
              DropdownMenuItem<String>(
                value: '',
                child: Text('Pilih ${label.toLowerCase()}'),
              ),
              ...opsi.map((item) {
                return DropdownMenuItem<String>(
                  value: item['id'],
                  child: Text(
                    item['name'],
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ],
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: wajibDiisi
                ? (value) => value == null || value.isEmpty
                    ? 'Harap pilih salah satu'
                    : null
                : null,
          ),
        ],
      ),
    );
  }

  Widget _bangunTombolUnggah() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Unggah Berkas',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton.icon(
            icon: Icon(Icons.cloud_upload, color: Colors.white),
            label: Text('Tambah Berkas', style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UploadScreen(
                  onFileUploaded: (String fileName) =>
                      setState(() => _namaFile = fileName),
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1F4C97),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          if (_namaFile != null) ...[
            SizedBox(height: 8),
            Text(
              'File terpilih: $_namaFile',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ],
      ),
    );
  }

  Widget _bangunTombolKirim() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _sedangMemuat ? null : _kirimForm,
        child: Text(
          _sedangMemuat ? 'Menyimpan...' : 'Simpan',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1F4C97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
=======
  Widget _buildTextField(String label, Function(String?) onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
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

  Widget _buildFileUploadButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unggah Berkas',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          icon: const Icon(Icons.cloud_upload, color: Colors.white),
          label: const Text(
            'Tambah Berkas',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UploadScreen(
                  onFileUploaded: (String fileName) {
                    setState(() {
                      _namaFile = fileName; // Update _namaFile setelah upload
                    });
                  },
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F4C97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (_namaFile != null)
          Text(
            'File terpilih: $_namaFile',
            style: const TextStyle(fontSize: 16),
          ),
        if (_namaFile == null)
          const Text(
            'Tidak ada file terpilih',
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Center( // Agar tombol berada di tengah
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5, // Lebar tombol 50% dari lebar layar
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Form berhasil disimpan')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F4C97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16), // Menambah padding vertikal
          ),
          child: Text(
            'Simpan',
            style: TextStyle(color: Colors.white), // Teks putih
          ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        ),
      ),
    );
  }
}
