import 'package:flutter/material.dart';
<<<<<<< HEAD

class DetailDosen extends StatelessWidget {
=======
import 'package:dio/dio.dart';

class DetailDosenPage extends StatefulWidget {
  final int dosenId;
  const DetailDosenPage({super.key, required this.dosenId});

  @override
  _DetailDosenState createState() => _DetailDosenState();
}

class _DetailDosenState extends State<DetailDosenPage> {
  final Dio _dio = Dio();
  bool _isLoading = true;
  Map<String, dynamic> _dosenDetail = {};

  @override
  void initState() {
    super.initState();
    _fetchDosenDetail();
  }

  Future<void> _fetchDosenDetail() async {
    try {
      final response = await _dio.get(
        'http://127.0.0.1:8000/api/dosen/${widget.dosenId}',
      );
      setState(() {
        _dosenDetail = response.data['data'];
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
        title: const Text(
          'Detail Dosen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1F4C97),
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section with image on the left and name on the right
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr.Eng. Rosa Andire Asmara, ST, MT.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'NIP: xxxxxxxx',
                          style: TextStyle(
                            color: Colors.grey,
=======
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Profile section with image on the left and name on the right
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _dosenDetail['avatar'] != null
                              ? NetworkImage('http://127.0.0.1:8000/storage/photos/${_dosenDetail['avatar']}')
                              : null, // Gambar dari server jika tersedia
                          child: _dosenDetail['avatar'] == null
                              ? const Icon(
                                  Icons.person,
                                  size: 35,
                                  color: Colors.white,
                                )
                              : null, // Jika avatar kosong, tampilkan icon
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _dosenDetail['nama'] ?? 'Nama tidak tersedia',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'NIP: ${_dosenDetail['nip'] ?? 'Tidak tersedia'}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Email: ${_dosenDetail['email'] ?? 'Tidak tersedia'}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                          ),
                        ),
                      ],
                    ),
                  ),
<<<<<<< HEAD
                ],
              ),
            ),

            const Divider(),
            // Field of Expertise
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Bidang Kemampuan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Image Processing, Artificial Intelligence',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),

                  // Contact Information (Email and WhatsApp)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'rosa@polinema.ac.id',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'No. Whatsapp',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '081234567890',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Certifications Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sertifikasi Yang Dimiliki',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Certification List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CertificationCard(
                    category: 'Programmer',
                    title: 'Oracle Certified Associate (OCA)',
                    organization: 'Oracle',
                  ),
                  CertificationCard(
                    category: 'IT Governance',
                    title: 'ITIL 4 Foundation',
                    organization: 'Axelos',
                  ),
                  CertificationCard(
                    category: 'Web Developer',
                    title: 'Junior Web Developer',
                    organization: 'BPPTIK',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
=======
                  const Divider(),

                  // Field of Expertise
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Bidang Kemampuan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _dosenDetail['bidang'] != null
                              ? _dosenDetail['bidang']['bidang_nama'] ?? 'Tidak tersedia'
                              : 'Tidak ada bidang keahlian',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Mata Kuliah',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _dosenDetail['mata_kuliah'] != null
                              ? _dosenDetail['mata_kuliah']['mk_nama'] ?? 'Tidak tersedia'
                              : 'Tidak ada mata kuliah',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4)
                      ],
                    ),
                  ),
                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sertifikat Yang Dimiliki',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  // Certification List
                  _dosenDetail['sertifikasi'] != null && (_dosenDetail['sertifikasi'] as List).isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: (_dosenDetail['sertifikasi'] as List).map<Widget>((sertifikasi) {
                            return CertificationCard(
                              category: sertifikasi['jenis']?['jenis_nama'] ?? 'Jenis tidak tersedia',
                              title: sertifikasi['nama_sertif'] ?? 'Nama tidak tersedia',
                              organization: sertifikasi['nama_vendor'] ?? 'Vendor tidak tersedia',
                            );
                          }).toList(),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),

                  _dosenDetail['pelatihan'] != null && (_dosenDetail['pelatihan'] as List).isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: (_dosenDetail['pelatihan'] as List).map<Widget>((pelatihan) {
                            return CertificationCard(
                              category: pelatihan['jenis']?['jenis_nama'] ?? 'Jenis tidak tersedia',
                              title: pelatihan['nama_sertif'] ?? 'Nama tidak tersedia',
                              organization: pelatihan['nama_vendor'] ?? 'Vendor tidak tersedia',
                            );
                          }).toList(),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                ],
              ),
            ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    );
  }
}

<<<<<<< HEAD
// Modified CertificationCard to match PelatihanItem design
=======
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
class CertificationCard extends StatelessWidget {
  final String category;
  final String title;
  final String organization;

  const CertificationCard({
<<<<<<< HEAD
    Key? key,
    required this.category,
    required this.title,
    required this.organization,
  }) : super(key: key);
=======
    super.key,
    required this.category,
    required this.title,
    required this.organization,
  });
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBE8FD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF616161),
<<<<<<< HEAD
                      fontSize: 12,
=======
                      fontSize: 10,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
<<<<<<< HEAD
                    fontSize: 16,
=======
                    fontSize: 14,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  organization,
                  style: const TextStyle(
<<<<<<< HEAD
                    fontSize: 14,
=======
                    fontSize: 12,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
<<<<<<< HEAD
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.image, color: Colors.grey),
          ),
=======
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        ],
      ),
    );
  }
}
