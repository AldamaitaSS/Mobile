import 'package:flutter/material.dart';

class BerhasilScreen extends StatelessWidget {
<<<<<<< HEAD
=======
  const BerhasilScreen({super.key});

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(
=======
        title: const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          'Data',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
<<<<<<< HEAD
          icon: Icon(Icons.arrow_back, color: Colors.white),
=======
          icon: const Icon(Icons.arrow_back, color: Colors.white),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          onPressed: () {
            Navigator.pop(context);
          },
        ),
<<<<<<< HEAD
        backgroundColor: Colors.blue[800],
=======
        backgroundColor: const Color(0xFF1F4C97),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
<<<<<<< HEAD
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
=======
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
<<<<<<< HEAD
  Future.delayed(Duration(seconds: 3), () {
=======
  Future.delayed(const Duration(seconds: 3), () {
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    Navigator.popUntil(context, (route) => route.isFirst);
  });
}
