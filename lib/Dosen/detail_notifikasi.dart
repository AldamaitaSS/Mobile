import 'package:flutter/material.dart';

class DetailNotifikasiScreen extends StatelessWidget {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800], // Latar biru penuh di belakang
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // Warna biru untuk header
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Panah kembali putih
=======
  const DetailNotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F4C97), // Latar biru penuh di belakang
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C97), // Warna biru untuk header
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Panah kembali putih
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          onPressed: () {
            Navigator.pop(context);
          },
        ),
<<<<<<< HEAD
        title: Text(
=======
        title: const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          'Detail Pelatihan',
          style: TextStyle(color: Colors.white), // Tulisan header putih
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian latar putih full screen dari atas sampai bawah
            Container(
              width: double.infinity,
<<<<<<< HEAD
              decoration: BoxDecoration(
=======
              decoration: const BoxDecoration(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                color: Colors.white, // Latar putih
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
<<<<<<< HEAD
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
=======
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header dalam kotak putih melengkung
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
<<<<<<< HEAD
                          padding: EdgeInsets.symmetric(
=======
                          padding: const EdgeInsets.symmetric(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
<<<<<<< HEAD
                            color: Color(0xFFDBE8FD), // Warna biru muda (kode DBE8FD)
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
=======
                            color: const Color(
                                0xFFDBE8FD), // Warna biru muda (kode DBE8FD)
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                            'Web Developer',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
<<<<<<< HEAD
                        SizedBox(height: 16),
                        Text(
=======
                        const SizedBox(height: 16),
                        const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                          'Junior Web Developer',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
<<<<<<< HEAD
                        SizedBox(height: 8),
                        Text(
=======
                        const SizedBox(height: 8),
                        const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                          'BPPTIK',
                          style: TextStyle(color: Colors.grey),
                        ),
                        // Garis pembatas setelah BPPTIK
<<<<<<< HEAD
                        SizedBox(height: 16),
                        Divider(),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Bagian Pendaftaran, Program Pelatihan, dan Pelaksanaan
                    Column(
=======
                        const SizedBox(height: 16),
                        const Divider(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Bagian Pendaftaran, Program Pelatihan, dan Pelaksanaan
                    const Column(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pendaftaran',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('11 January 2024 - 21 September 2024'),
                        SizedBox(height: 20),
                        // Program Pelatihan dan Pelaksanaan dalam Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Program Pelatihan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('24 January 2024 - 20 November 2024'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pelaksanaan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Online'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    SizedBox(height: 20),
                    Divider(),
                    // Bagian Deskripsi Program
                    Text(
=======
                    const SizedBox(height: 20),
                    const Divider(),
                    // Bagian Deskripsi Program
                    const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      'Deskripsi Program',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(height: 10),
                    Text(
=======
                    const SizedBox(height: 10),
                    const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      'Junior Web Developer merupakan salah satu Skema '
                      'Pelatihan yang berbasis Standar Kompetensi Kerja Nasional '
                      'Indonesia (SKKNI) dengan skema Junior Web Developer. '
                      'Peserta pelatihan Junior Web Developer akan mampu membangun '
                      'dan mengelola aplikasi berbasis web dengan bahasa pemrograman. '
                      'Di akhir pelatihan, peserta akan mengikuti uji kompetensi '
                      'dan sertifikasi Junior Web Developer, bagi yang dinyatakan '
                      'kompeten akan mendapatkan Sertifikat Kompetensi Junior Web Developer '
                      'dari BNSP.',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(height: 10),
                    // Persyaratan Peserta
                    Text(
=======
                    const SizedBox(height: 10),
                    // Persyaratan Peserta
                    const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      'Persyaratan Peserta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(height: 5),
                    Text(
=======
                    const SizedBox(height: 5),
                    const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      '- Warga Negara Indonesia\n'
                      '- Usia Maksimal 29 Tahun pada saat mendaftar\n'
                      '- Lulusan SMK atau sederajat, D1, D2, D3, dan D4\n'
                      '- Belum Mendapatkan Pekerjaan Tetap/sedang tidak bekerja\n'
                      '- Lolos Seleksi Administrasi dan Tes Substansi',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(height: 20),
=======
                    const SizedBox(height: 20),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    // Tombol Bersedia dan Tidak
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Aksi ketika tombol "Bersedia" ditekan
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            backgroundColor: Colors.blue[800],
=======
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            backgroundColor: const Color(0xFF1F4C97),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
<<<<<<< HEAD
                          child: Text(
=======
                          child: const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                            'Bersedia',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
<<<<<<< HEAD
                        SizedBox(width: 20),
=======
                        const SizedBox(width: 20),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        ElevatedButton(
                          onPressed: () {
                            // Aksi ketika tombol "Tidak" ditekan
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
=======
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Tidak',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    SizedBox(height: 20),
=======
                    const SizedBox(height: 20),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
