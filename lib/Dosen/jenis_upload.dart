import 'package:flutter/material.dart';
import 'package:project/Dosen/upload_sertifikasi.dart';
import 'upload_pelatihan.dart'; // Import halaman form_upload

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
                              SertifikasiUploadForm(jenis: 'Sertifikasi'),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.verified, // Ikon untuk Sertifikasi
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10), // Jarak antara ikon dan teks
                        Text(
                          'Sertifikasi',
                          style: TextStyle(
                            color: Colors.white, // Ubah teks menjadi putih
                            fontSize: 18,
                          ),
                        ),
                      ],
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
                              PelatihanUploadForm(jenis: 'Pelatihan'),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.school, // Ikon untuk Pelatihan
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10), // Jarak antara ikon dan teks
                        Text(
                          'Pelatihan',
                          style: TextStyle(
                            color: Colors.white, // Ubah teks menjadi putih
                            fontSize: 18,
                          ),
                        ),
                      ],
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
