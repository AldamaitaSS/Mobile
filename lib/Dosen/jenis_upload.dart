import 'package:flutter/material.dart';
import 'form_upload.dart'; // Import halaman form_upload

class JenisUploadScreen extends StatelessWidget {
  const JenisUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F4C97),
      ),
      body: Stack(
        children: [
          // Latar belakang putih bersih
          Container(
            color: Colors.white,
          ),
          // Set lingkaran atas
          Positioned(
            top: -150,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEDF6FF),
              ),
            ),
          ),
          // Set lingkaran bawah
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEDF6FF),
              ),
            ),
          ),
          // Konten di tengah
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Box Sertifikasi
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 150, // Ukuran tombol
                  height: 200, // Ukuran tinggi tombol
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CertificationUploadForm(jenis: 'Sertifikasi'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1F4C97), // Latar belakang biru tua
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Atur lengkungan di sini
                      ),
                    ),
                    child: Text(
                      'Sertifikasi',
                      style: TextStyle(
                          color: Colors.white), // Ubah teks menjadi putih
                    ),
                  ),
                ),
                // Box Pelatihan
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 150, // Ukuran tombol
                  height: 200, // Ukuran tinggi tombol
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CertificationUploadForm(jenis: 'Pelatihan'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1F4C97), // Latar belakang biru tua
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Atur lengkungan di sini
                      ),
                    ),
                    child: Text(
                      'Pelatihan',
                      style: TextStyle(
                          color: Colors.white), // Ubah teks menjadi putih
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
