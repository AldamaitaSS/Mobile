import 'package:flutter/material.dart';
import 'api_service.dart';

class BidangListScreen extends StatefulWidget {
  @override
  _BidangListScreenState createState() => _BidangListScreenState();
}

class _BidangListScreenState extends State<BidangListScreen> {
  final ApiService apiService = ApiService(); // Inisialisasi ApiService
  List<dynamic> bidangList = []; // Daftar untuk menyimpan data bidang
  bool isLoading = true; // Indikator loading

  @override
  void initState() {
    super.initState();
    fetchBidang(); // Panggil fungsi untuk mengambil data saat widget diinisialisasi
  }

  // Fungsi untuk mengambil data bidang
  Future<void> fetchBidang() async {
    try {
      final bidang = await apiService.getBidang(); // Panggil API service
      setState(() {
        bidangList = bidang; // Simpan data di bidangList
        isLoading = false; // Set indikator loading menjadi false
      });
    } catch (e) {
      print('Failed to load bidang: $e');
      setState(() {
        isLoading = false; // Set indikator loading menjadi false jika gagal
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bidang List'),
        backgroundColor: Color(0xFF1F4C97),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Tampilkan loading spinner
          : ListView.builder(
              itemCount: bidangList.length,
              itemBuilder: (context, index) {
                final bidang = bidangList[index];
                return ListTile(
                  title: Text(bidang['bidang_nama']), // Tampilkan nama bidang
                  subtitle: Text(bidang['bidang_kode']), // Tampilkan kode bidang
                );
              },
            ),
    );
  }
}
