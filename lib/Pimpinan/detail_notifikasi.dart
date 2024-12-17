import 'package:flutter/material.dart';

class DetailNotifikasiPage extends StatelessWidget {
  final String namaDosen;
  final bool? isAccepted; // Status apakah rekomendasi diterima atau tidak
  final String alasan; // Alasan jika rekomendasi ditolak

<<<<<<< HEAD
  DetailNotifikasiPage({
=======
  const DetailNotifikasiPage({super.key, 
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    required this.namaDosen,
    this.isAccepted,
    this.alasan = "",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        backgroundColor: Colors.blue[800],
        title: Text(
=======
        backgroundColor: const Color(0xFF1F4C97),
        title: const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          "Notifikasi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity, // Memastikan lebar penuh
        height: double.infinity, // Memastikan tinggi penuh
        color: Colors.white, // Latar belakang putih bersih
        child: Stack(
          children: [
            // Latar belakang hitam transparan
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Center(
              child: Container(
                width: 300,
<<<<<<< HEAD
                padding: EdgeInsets.all(30), // Memperlebar konten ke bawah
=======
                padding: const EdgeInsets.all(30), // Memperlebar konten ke bawah
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
<<<<<<< HEAD
                      offset: Offset(0, 2),
=======
                      offset: const Offset(0, 2),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Lingkaran dengan ikon notifikasi
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
<<<<<<< HEAD
                        border: Border.all(color: Colors.blue[800]!, width: 2),
                      ),
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Menampilkan nama dosen
                    Text(
                      "Dosen $namaDosen",
                      style: TextStyle(
=======
                        border: Border.all(color: const Color(0xFF1F4C97), width: 2),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        size: 30,
                        color: Color(0xFF1F4C97),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Menampilkan nama dosen
                    Text(
                      "Dosen $namaDosen",
                      style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        fontSize: 18,
                        fontWeight: FontWeight.w500, // Medium bold
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(height: 5),
=======
                    const SizedBox(height: 5),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    // Menampilkan status rekomendasi
                    Text(
                      isAccepted == true
                          ? "telah menerima rekomendasi pelatihan dari Anda"
                          : "telah menolak rekomendasi pelatihan dari Anda",
<<<<<<< HEAD
                      style: TextStyle(
=======
                      style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
<<<<<<< HEAD
                    SizedBox(height: 10),
=======
                    const SizedBox(height: 10),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    // Menampilkan alasan jika tidak diterima
                    if (isAccepted == false && alasan.isNotEmpty)
                      Text(
                        "Alasan: $alasan",
<<<<<<< HEAD
                        style: TextStyle(
=======
                        style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                          fontSize: 14,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
<<<<<<< HEAD
                    SizedBox(height: 20),
=======
                    const SizedBox(height: 20),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    // Tombol OK
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk menutup notifikasi
                        Navigator.pop(context);
                      },
<<<<<<< HEAD
                      child: Text("OK"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800], // Latar biru
                      ),
=======
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F4C97), // Latar biru
                      ),
                      child: Text("OK"),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
