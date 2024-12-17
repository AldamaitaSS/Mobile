import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../auth_service.dart';
import 'detail_sertifikat.dart';

class TotalSertifikasi extends StatefulWidget {
  const TotalSertifikasi({super.key});

  @override
  State<TotalSertifikasi> createState() => _TotalSertifikasiState();
}

class _TotalSertifikasiState extends State<TotalSertifikasi> {
  List<dynamic> dataPelatihan = [];
  List<dynamic> dataSertifikasi = [];
  String selectedCategory = 'pelatihan';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const String apiUrl = 'http://127.0.0.1:8000/api/sertifikat';

    try {
      // Memuat token dari AuthService
      final authService = AuthService(); // Instansiasi AuthService
      final token = await authService.getToken();
      if (token == null) throw Exception('Token not found');

      // Melakukan permintaan API dengan header Authorization
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // Memproses respons API
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          dataPelatihan = jsonResponse['data_pelatihan'] ?? [];
          dataSertifikasi = jsonResponse['data_sertifikasi'] ?? [];
        });
      } else {
        print('Failed to load data with status: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Menangani error
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat data pelatihan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> currentData =
        selectedCategory == 'pelatihan' ? dataPelatihan : dataSertifikasi;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C97),
        foregroundColor: Colors.white,
        title: const Text('Total Sertifikat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Filter Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterButton(
                  text: 'Pelatihan',
                  isSelected: selectedCategory == 'pelatihan',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'pelatihan';
                    });
                  },
                ),
                const SizedBox(width: 12),
                FilterButton(
                  text: 'Sertifikasi',
                  isSelected: selectedCategory == 'sertifikasi',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'sertifikasi';
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: currentData.length,
              itemBuilder: (context, index) {
                final item = currentData[index];
                return PelatihanItem(
                  category: selectedCategory == 'pelatihan'
                      ? 'Pelatihan'
                      : 'Sertifikasi',
                  jenis: item['jenis']?['jenis_nama'],
                  title: item['nama_sertif'],
                  institution:
                      item['nama_vendor'] ?? 'Tidak dapat memuat vendor',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailSertifikat(data: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Filter Button Widget
class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1F4C97) : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

// List Item Widget
class PelatihanItem extends StatelessWidget {
  final String category;
  final String jenis;
  final String title;
  final String institution;
  final VoidCallback? onTap;

  const PelatihanItem({
    super.key,
    required this.category,
    required this.jenis,
    required this.title,
    required this.institution,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
              offset: const Offset(0, 3),
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
                    color: const Color(0xFFDBE8FD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    jenis,
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  institution,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
