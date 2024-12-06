import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DetailPelatihanPage extends StatefulWidget {
  final int pelatihanId;

  const DetailPelatihanPage({super.key, required this.pelatihanId});

  @override
  State<DetailPelatihanPage> createState() => _DetailPelatihanPageState();
}

class _DetailPelatihanPageState extends State<DetailPelatihanPage> {
  final Dio _dio = Dio();
  final String baseUrl = 'http://192.168.70.53/web/public/api';
  Map<String, dynamic>? _pelatihanData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPelatihanDetail();
  }

  Future<void> _fetchPelatihanDetail() async {
    try {
      final response =
          await _dio.get('$baseUrl/pelatihan/${widget.pelatihanId}');

      setState(() {
        _pelatihanData = response.data['data'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
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
        title: const Text('Detail Pelatihan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pelatihanData == null
              ? const Center(child: Text('Data tidak ditemukan'))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBE8FD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _pelatihanData!['bidang_nama'] ??
                                'Tidak ada bidang',
                            style: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _pelatihanData!['nama_pelatihan'] ?? 'Tidak ada nama',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _pelatihanData!['level_pelatihan_nama'] ??
                                'Tidak ada tingkat',
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                            'Vendor',
                            _pelatihanData!['vendor_nama'] ??
                                'Tidak ada vendor'),
                        _buildInfoRow('Tanggal',
                            _pelatihanData!['tanggal'] ?? 'Tidak ada tanggal'),
                        const SizedBox(height: 30),
                        const Text(
                          'Deskripsi Program',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _pelatihanData!['deskripsi'] ?? 'Tidak ada deskripsi',
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.justify,
                        ),
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
