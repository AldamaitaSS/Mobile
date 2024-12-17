import 'package:flutter/material.dart';
<<<<<<< HEAD

class DetailPelatihanPage extends StatelessWidget {
  const DetailPelatihanPage({super.key});
=======
import 'package:dio/dio.dart';

class DetailPelatihanPage extends StatefulWidget {
  final int pelatihanId;

  const DetailPelatihanPage({super.key, required this.pelatihanId});

  @override
  State<DetailPelatihanPage> createState() => _DetailPelatihanPageState();
}

class _DetailPelatihanPageState extends State<DetailPelatihanPage> {
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api';
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
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

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
<<<<<<< HEAD
            Navigator.pop(context); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Modifikasi kategori menjadi tampilan seperti gambar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFDBE8FD),
                  borderRadius: BorderRadius.circular(20), // Sudut melengkung
                ),
                child: const Text(
                  'Web Developer',
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Junior Web Developer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text('BPPTIK', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              _buildInfoRow(
                  'Pendaftaran', '11 January 2024 - 25 September 2024'),
              _buildInfoRow(
                  'Program Pelatihan', '24 January 2024 - 20 November 2024'),
              _buildInfoRow('Pelaksanaan', 'Online'),
              const SizedBox(height: 30),
              const Text(
                'Deskripsi Program',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Junior Web Developer merupakan salah satu skema pelatihan yang berbasis Standar Kompetensi Kerja Nasional Indonesia (SKKNI) dengan skema Junior Web Developer. Peserta pelatihan akan dibekali dengan kompetensi teknis dan non-teknis yang mengacu pada SKKNI berbasis web dan gaya bahasa pemrograman. Di akhir pelatihan, peserta akan mengikuti uji kompetensi dan sertifikasi Junior Web Developer, bagi yang dinyatakan kompeten akan mendapatkan Sertifikat Kompetensi Junior Web Developer dari BNSP.',
                style: TextStyle(color: Colors.grey[600]),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1F4C97),
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
=======
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
                            _pelatihanData!['jenis']?['jenis_nama'] ??
                                'Tidak ada jenis',
                            style: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _pelatihanData!['nama_pelatihan'] ?? 'Tidak ada nama',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _pelatihanData!['vendor']?['vendor_nama'] ??
                                'Tidak ada vendor',
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                            'Level Pelatihan',
                            _pelatihanData!['level_pelatihan'] ??
                                'Tidak ada level'),
                        _buildInfoRow('Tanggal',
                            _pelatihanData!['tanggal'] ?? 'Tidak ada tanggal'),
                        _buildInfoRow('Lokasi',
                            _pelatihanData!['lokasi'] ??
                                'Tidak ada lokasi'),
                        const SizedBox(height: 30),
                        const Text(
                          'Deskripsi Pelatihan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _pelatihanData!['deskripsi'] ?? 'Tidak ada deskripsi',
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
<<<<<<< HEAD

class UserListItem extends StatelessWidget {
  final String name;

  const UserListItem(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
=======
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
