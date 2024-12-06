import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DetailSertifikasiPage extends StatefulWidget {
  final int sertifikasiId;

  const DetailSertifikasiPage({super.key, required this.sertifikasiId});

  @override
  State<DetailSertifikasiPage> createState() => _DetailSertifikasiPageState();
}

class _DetailSertifikasiPageState extends State<DetailSertifikasiPage> {
  final Dio _dio = Dio();
  final String baseUrl = 'http://192.168.70.53/web/public/api';
  Map<String, dynamic>? _sertifikasiData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSertifikasiDetail();
  }

  Future<void> _fetchSertifikasiDetail() async {
    try {
      final response =
          await _dio.get('$baseUrl/sertifikasi/${widget.sertifikasiId}');

      setState(() {
        _sertifikasiData =
            response.data['data']; // Pastikan mengakses data dari respons
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C97),
        foregroundColor: Colors.white,
        title: const Text('Detail Sertifikasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _sertifikasiData == null
              ? const Center(child: Text('Data tidak ditemukan'))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        // Bidang (Web Developer)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBE8FD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _sertifikasiData!['bidang_nama'] ??
                                'Tidak ada bidang',
                            style: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Nama Sertifikasi (Junior Web Developer)
                        Text(
                          _sertifikasiData!['nama_sertifikasi'] ??
                              'Tidak ada nama',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        // Jenis (BPPTIK)
                        Text(
                            _sertifikasiData!['jenis_nama'] ??
                                'Tidak ada jenis',
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        // Tanggal
                        _buildInfoRow(
                            'Pendaftaran',
                            _sertifikasiData!['tanggal'] ??
                                'Tidak ada tanggal'),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Implement registration logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F4C97),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 3,
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('Daftar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
