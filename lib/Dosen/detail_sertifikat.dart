import 'package:flutter/material.dart';
<<<<<<< HEAD

class DetailSertifikat extends StatelessWidget {
  const DetailSertifikat({super.key});
=======
import 'package:url_launcher/url_launcher.dart';

class DetailSertifikat extends StatelessWidget {
  final dynamic data;

  const DetailSertifikat({super.key, required this.data});

  void _openPdf(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal membuka PDF: $url'),
        ),
      );
    }
  }
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
<<<<<<< HEAD
          'Detail Sertifikasi',
=======
          'Detail Sertifikat',
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1F4C97),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(Icons.image, color: Colors.grey, size: 50),
              ),
            ),
            const SizedBox(height: 16),
=======
            const SizedBox(height: 8),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDBE8FD),
                borderRadius: BorderRadius.circular(8),
              ),
<<<<<<< HEAD
              child: const Text(
                'IT Governance',
                style: TextStyle(
=======
              child: Text(
                data['jenis']?['jenis_nama'] ?? 'Tidak tersedia',
                style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  color: Color(0xFF616161),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
<<<<<<< HEAD
            const Text(
              'ITIL 4 Foundation',
              style: TextStyle(
                fontSize: 22,
=======
            Text(
              data['nama_sertif'] ?? 'Nama Sertifikat Tidak Tersedia',
              style: const TextStyle(
                fontSize: 18,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
<<<<<<< HEAD
            const Text(
              'Axelos',
              style: TextStyle(
=======
            Text(
              data['nama_vendor'] ?? 'Vendor Tidak Tersedia',
              style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
<<<<<<< HEAD
            buildCertificationDetailRow('Effective From', 'xx-xx-xxxx'),
            buildCertificationDetailRow('Expiry Date', 'xx-xx-xxxx'),
            buildCertificationDetailRow('Nomor Sertifikat', 'xxxxxxxxxxxxxxx'),
            buildCertificationDetailRow('Nomor Peserta', 'xxxxxxxxxxxxxxx'),
            buildCertificationDetailRow('Tanggal Pelatihan', 'xx-xx-xxxx'),
=======
            buildCertificationDetailRow('Nomor Sertifikat',
                data['no_sertif'] ?? 'Tidak tersedia'),
            buildCertificationDetailRow(
                'Tanggal', data['tanggal'] ?? 'Tidak tersedia'),
            buildCertificationDetailRow('Masa Berlaku',
                data['masa_berlaku'] ?? 'Tidak tersedia'),
            const SizedBox(height: 30),
            if (data['bukti'] != null && data['bukti'].isNotEmpty)
              data['bukti'].endsWith('.pdf')
                  ? Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A4C6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.picture_as_pdf,
                              color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          const Text(
                            'Dokumen PDF tersedia.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => _openPdf(data['bukti'], context),
                            child: const Text(
                              'Buka PDF',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Foto Bukti Sertifikat:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data['bukti'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Text('Gagal memuat gambar'),
                            ),
                          ),
                        ],
                      ),
                    )
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          ],
        ),
      ),
    );
  }

  Widget buildCertificationDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
<<<<<<< HEAD
              color: Color(0xFF616161),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
=======
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            ),
          ),
        ],
      ),
    );
  }
}
<<<<<<< HEAD
  
=======
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
