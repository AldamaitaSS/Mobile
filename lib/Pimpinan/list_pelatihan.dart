import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'detail_pelatihan.dart'; // Pastikan file detail_pelatihan.dart diimpor
=======
import 'package:dio/dio.dart';
import 'detail_pelatihan.dart';
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

class ListPelatihanPage extends StatefulWidget {
  const ListPelatihanPage({super.key});

  @override
  _ListPelatihanPageState createState() => _ListPelatihanPageState();
}

class _ListPelatihanPageState extends State<ListPelatihanPage> {
<<<<<<< HEAD
  bool isTersediaSelected = true;
=======
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api/pelatihan';
  List<dynamic> pelatihanList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPelatihan();
  }

  Future<void> _fetchPelatihan() async {
    try {
      final response = await _dio.get(baseUrl);
      setState(() {
        pelatihanList = response.data['data'];
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
<<<<<<< HEAD



      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C97), 
=======
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C97),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        foregroundColor: Colors.white,
        title: const Text('List Pelatihan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
<<<<<<< HEAD
      body: Column(
        children: [
          const SizedBox(height: 20),
          // List of Pelatihan
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                PelatihanItem(
                  category: 'Business Management',
                  title: 'Perancangan Pemasaran Online',
                  institution: 'BNSP',
                ),
                PelatihanItem(
                  category: 'Data Science',
                  title: 'Associate Data Scientist',
                  institution: 'LSP Digital',
                ),
                PelatihanItem(
                  category: 'Web Developer',
                  title: 'Junior Web Developer',
                  institution: 'BPPTIK',
                  onTap: () {
                    // Navigasi ke halaman detail pelatihan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailPelatihanPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
=======
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : pelatihanList.isEmpty
              ? const Center(child: Text('Tidak ada data pelatihan'))
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: pelatihanList.length,
                  itemBuilder: (context, index) {
                    final pelatihan = pelatihanList[index];
                    return PelatihanItem(
                      category: pelatihan['jenis']?['jenis_nama'] ??
                          'Tidak ada jenis',
                      title: pelatihan['nama_pelatihan'] ?? 'Tidak ada nama',
                      institution: pelatihan['vendor']?['vendor_nama'] ??
                          'Tidak ada vendor',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPelatihanPage(
                                pelatihanId: pelatihan['pelatihan_id']),
                          ),
                        );
                      },
                    );
                  },
                ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    );
  }
}

// Widget untuk menampilkan setiap item pelatihan
class PelatihanItem extends StatelessWidget {
  final String category;
  final String title;
  final String institution;
<<<<<<< HEAD
  final VoidCallback? onTap; // Tambahkan onTap sebagai parameter opsional
=======
  final VoidCallback? onTap;
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  const PelatihanItem({
    super.key,
    required this.category,
    required this.title,
    required this.institution,
<<<<<<< HEAD
    this.onTap, // Inisialisasi onTap
=======
    this.onTap,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
<<<<<<< HEAD
      // Menggunakan InkWell untuk mendeteksi klik
      onTap: onTap, // Fungsi onTap yang dieksekusi saat item diklik
=======
      onTap: onTap,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
<<<<<<< HEAD
              offset: const Offset(0, 3), // Position of the shadow
=======
              offset: const Offset(0, 3),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
<<<<<<< HEAD
                    color: Color(0xFFDBE8FD),
=======
                    color: const Color(0xFFDBE8FD),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  institution,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.image, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
