import 'package:flutter/material.dart';
import 'form_upload.dart'; // Import halaman form_upload

class JenisUploadScreen extends StatelessWidget {
<<<<<<< HEAD
=======
  const JenisUploadScreen({super.key});

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(
          'Data',
          style: TextStyle(color: Colors.white), // Warna teks diubah menjadi putih
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xFF1F4C97),
=======
        title: const Text(
          'Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F4C97),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
<<<<<<< HEAD
              decoration: BoxDecoration(
=======
              decoration: const BoxDecoration(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
<<<<<<< HEAD
              decoration: BoxDecoration(
=======
              decoration: const BoxDecoration(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
<<<<<<< HEAD
                  margin: EdgeInsets.all(10),
=======
                  margin: const EdgeInsets.all(10),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  width: 150, // Ukuran tombol
                  height: 200, // Ukuran tinggi tombol
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
<<<<<<< HEAD
                          builder: (context) => CertificationUploadForm(jenis: 'Sertifikasi'),
                        ),
                      );
                    },
                    child: Text(
                      'Sertifikasi',
                      style: TextStyle(color: Colors.white), // Ubah teks menjadi putih
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F4C97), // Latar belakang biru tua
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Atur lengkungan di sini
                      ),
                    ),
=======
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
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  ),
                ),
                // Box Pelatihan
                Container(
<<<<<<< HEAD
                  margin: EdgeInsets.all(10),
=======
                  margin: const EdgeInsets.all(10),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  width: 150, // Ukuran tombol
                  height: 200, // Ukuran tinggi tombol
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
<<<<<<< HEAD
                          builder: (context) => CertificationUploadForm(jenis: 'Pelatihan'),
                        ),
                      );
                    },
                    child: Text(
                      'Pelatihan',
                      style: TextStyle(color: Colors.white), // Ubah teks menjadi putih
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F4C97), // Latar belakang biru tua
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Atur lengkungan di sini
                      ),
                    ),
=======
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
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
