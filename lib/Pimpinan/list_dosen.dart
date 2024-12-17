import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:aplikasi_sertifikasi/Pimpinan/detail_dosen.dart';

// Halaman List Dosen
class ListDosenPage extends StatefulWidget {
  const ListDosenPage({Key? key}) : super(key: key);
=======
import 'package:dio/dio.dart';
import 'detail_dosen.dart';

class ListDosenPage extends StatefulWidget {
  const ListDosenPage({super.key});
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  _ListDosenPageState createState() => _ListDosenPageState();
}

class _ListDosenPageState extends State<ListDosenPage> {
<<<<<<< HEAD
  bool isTersediaSelected = true;
=======
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api/dosen'; // API endpoint
  List<dynamic> dosenList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDosen();
  }

  Future<void> _fetchDosen() async {
    try {
      final response = await _dio.get(baseUrl);
      setState(() {
        dosenList = response.data['data'];
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
        title: const Text('List Dosen'),
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
          const SizedBox(height: 24),
          // List of Dosen
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                DosenItem(
                  name: 'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailDosen()),
                    );
                  },
                ),
                DosenItem(
                  name: 'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                  onTap: () {
                    // Action when tapping a dosen item
                  },
                ),
                DosenItem(
                  name: 'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                  onTap: () {
                    // Action when tapping a dosen item
                  },
                ),
                DosenItem(
                  name: 'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                  onTap: () {
                    // Action when tapping a dosen item
                  },
                ),
                DosenItem(
                  name: 'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                  onTap: () {
                    // Action when tapping a dosen item
                  },
                ),
                DosenItem(
                  name: 'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                  onTap: () {
                    // Action when tapping a dosen item
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
          : dosenList.isEmpty
              ? const Center(child: Text('Tidak ada data dosen'))
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: dosenList.length,
                  itemBuilder: (context, index) {
                    final dosen = dosenList[index];
                    return DosenItem(
                      name: dosen['nama'] ?? 'Tidak ada nama',
                      nip: 'NIP: ${dosen['nip'] ?? 'Tidak ada nip'}',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailDosenPage(
                              dosenId: dosen[
                                  'user_id'], // Kirim ID dosen ke halaman detail
                            ),
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

// Widget untuk menampilkan setiap item dosen
class DosenItem extends StatelessWidget {
  final String name;
<<<<<<< HEAD
  final VoidCallback? onTap;

  const DosenItem({
    Key? key,
    required this.name,
    this.onTap,
  }) : super(key: key);
=======
  final String nip;
  final VoidCallback? onTap;

  const DosenItem({
    super.key,
    required this.name,
    required this.nip,
    this.onTap,
  });
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 16),
<<<<<<< HEAD
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
=======
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4), // Spacer between name and NIP
                Text(
                  nip ,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
