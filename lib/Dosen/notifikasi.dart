import 'package:flutter/material.dart';
import 'detail_notifikasi.dart'; // Pastikan file ini ada di project kamu

class NotifikasiScreen extends StatefulWidget {
<<<<<<< HEAD
=======
  const NotifikasiScreen({super.key});

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  bool _isTerbaruSelected = true;
  String? _selectedFilter = "Semua";

  // Contoh data notifikasi
  final List<Map<String, String>> notifikasiList = [
    {"pengirim": "Admin", "pesan": "Admin merekomendasikan pelatihan ini."},
    {"pengirim": "Pimpinan", "pesan": "Pimpinan merekomendasikan webinar ini."},
    {"pengirim": "Admin", "pesan": "Admin mengirim pelatihan terbaru."},
<<<<<<< HEAD
    {"pengirim": "Pimpinan", "pesan": "Pimpinan mengucapkan selamat tahun baru."},
=======
    {
      "pengirim": "Pimpinan",
      "pesan": "Pimpinan mengucapkan selamat tahun baru."
    },
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  ];

  // Fungsi untuk memfilter notifikasi berdasarkan pilihan filter
  List<Map<String, String>> getFilteredNotifikasi() {
    if (_selectedFilter == "Semua") {
      return notifikasiList;
    } else {
<<<<<<< HEAD
      return notifikasiList.where((notifikasi) => notifikasi['pengirim'] == _selectedFilter).toList();
=======
      return notifikasiList
          .where((notifikasi) => notifikasi['pengirim'] == _selectedFilter)
          .toList();
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        backgroundColor: Color(0xFF1F4C97),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Panah kembali putih
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Notifikasi",
          style: TextStyle(color: Colors.white), // Tulisan header notifikasi putih
=======
        backgroundColor: const Color(0xFF1F4C97),
        title: const Text(
          "Notifikasi",
          style:
              TextStyle(color: Colors.white), // Tulisan header notifikasi putih
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        ),
      ),
      body: Container(
        color: Colors.white, // Background putih di belakang notifikasi
        child: Column(
          children: [
            // Row untuk Terbaru dan Semua
            Container(
              color: Colors.white,
<<<<<<< HEAD
              padding: EdgeInsets.all(10),
=======
              padding: const EdgeInsets.all(10),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isTerbaruSelected = true;
                      });
                    },
                    child: Container(
<<<<<<< HEAD
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: _isTerbaruSelected ? Color(0xFF1F4C97) : Colors.grey[200],
=======
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: _isTerbaruSelected
                            ? const Color(0xFF1F4C97)
                            : Colors.grey[200],
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Terbaru",
                        style: TextStyle(
<<<<<<< HEAD
                          fontWeight: _isTerbaruSelected ? FontWeight.bold : FontWeight.normal,
                          color: _isTerbaruSelected ? Colors.white : Colors.black, // Ubah warna berdasarkan status
=======
                          fontWeight: _isTerbaruSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _isTerbaruSelected
                              ? Colors.white
                              : Colors.black, // Ubah warna berdasarkan status
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isTerbaruSelected = false;
                      });
                    },
                    child: Container(
<<<<<<< HEAD
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: !_isTerbaruSelected ? Color(0xFF1F4C97) : Colors.grey[200],
=======
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: !_isTerbaruSelected
                            ? const Color(0xFF1F4C97)
                            : Colors.grey[200],
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Semua",
                        style: TextStyle(
<<<<<<< HEAD
                          fontWeight: !_isTerbaruSelected ? FontWeight.bold : FontWeight.normal,
                          color: !_isTerbaruSelected ? Colors.white : Colors.black, // Ubah warna berdasarkan status
=======
                          fontWeight: !_isTerbaruSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: !_isTerbaruSelected
                              ? Colors.white
                              : Colors.black, // Ubah warna berdasarkan status
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Kotak filter di bawah
            Container(
<<<<<<< HEAD
              padding: EdgeInsets.all(10),
=======
              padding: const EdgeInsets.all(10),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFilterBox("Semua"),
<<<<<<< HEAD
                  SizedBox(width: 10), // Jarak antara kotak filter
                  _buildFilterBox("Admin"),
                  SizedBox(width: 10), // Jarak antara kotak filter
=======
                  const SizedBox(width: 10), // Jarak antara kotak filter
                  _buildFilterBox("Admin"),
                  const SizedBox(width: 10), // Jarak antara kotak filter
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  _buildFilterBox("Pimpinan"),
                ],
              ),
            ),
            // ListView untuk menampilkan notifikasi
            Expanded(
              child: ListView.builder(
<<<<<<< HEAD
                padding: EdgeInsets.all(10),
                itemCount: getFilteredNotifikasi().length, // Jumlah notifikasi yang sudah difilter
                itemBuilder: (context, index) {
                  final notifikasi = getFilteredNotifikasi()[index]; // Notifikasi yang sudah difilter
=======
                padding: const EdgeInsets.all(10),
                itemCount: getFilteredNotifikasi()
                    .length, // Jumlah notifikasi yang sudah difilter
                itemBuilder: (context, index) {
                  final notifikasi = getFilteredNotifikasi()[
                      index]; // Notifikasi yang sudah difilter
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail ketika notifikasi ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
<<<<<<< HEAD
                          builder: (context) => DetailNotifikasiScreen(), // Halaman tujuan
=======
                          builder: (context) =>
                              DetailNotifikasiScreen(), // Halaman tujuan
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        ),
                      );
                    },
                    child: Container(
<<<<<<< HEAD
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: _isTerbaruSelected ? Color(0xFFEDF6FF) : Colors.grey[300],
=======
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: _isTerbaruSelected
                            ? const Color(0xFFEDF6FF)
                            : Colors.grey[300],
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
<<<<<<< HEAD
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person),
                              ),
                              SizedBox(width: 10),
                              Text(
                                notifikasi["pengirim"] ?? "Unknown",
                                style: TextStyle(
                                  fontWeight: _isTerbaruSelected ? FontWeight.bold : FontWeight.normal,
=======
                              const CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                notifikasi["pengirim"] ?? "Unknown",
                                style: TextStyle(
                                  fontWeight: _isTerbaruSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
<<<<<<< HEAD
                          SizedBox(height: 5),
                          Text(
                            notifikasi["pesan"] ?? "Pesan tidak tersedia",
                            style: TextStyle(
                              fontWeight: _isTerbaruSelected ? FontWeight.bold : FontWeight.normal,
=======
                          const SizedBox(height: 5),
                          Text(
                            notifikasi["pesan"] ?? "Pesan tidak tersedia",
                            style: TextStyle(
                              fontWeight: _isTerbaruSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterBox(String title) {
    bool isSelected = _selectedFilter == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = title; // Set filter yang dipilih
        });
      },
      child: Container(
<<<<<<< HEAD
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Padding kecil untuk kotak filter
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF1F4C97) : Colors.grey[200], // Warna background
=======
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 6), // Padding kecil untuk kotak filter
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1F4C97)
              : Colors.grey[200], // Warna background
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54, // Warna teks
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
