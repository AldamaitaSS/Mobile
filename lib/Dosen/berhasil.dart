import 'package:flutter/material.dart';

class BerhasilScreen extends StatelessWidget {
  const BerhasilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1F4C97),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Container(
              width: 423,
              height: 291,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 60,
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Data berhasil disimpan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Fungsi untuk menampilkan halaman berhasil
void showBerhasilScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BerhasilScreen(),
    ),
  );

  // Kembali ke halaman sebelumnya setelah 3 detik
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.popUntil(context, (route) => route.isFirst);
  });
}
