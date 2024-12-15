import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detail Sertifikat',
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
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDBE8FD),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data['jenis']?['jenis_nama'] ?? 'Tidak tersedia',
                style: const TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data['nama_sertif'] ?? 'Nama Sertifikat Tidak Tersedia',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data['nama_vendor'] ?? 'Vendor Tidak Tersedia',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            buildCertificationDetailRow('Nomor Sertifikat',
                data['no_sertif'] ?? 'Tidak tersedia'),
            buildCertificationDetailRow(
                'Tanggal', data['tanggal'] ?? 'Tidak tersedia'),
            buildCertificationDetailRow('Masa Berlaku',
                data['masa_berlaku'] ?? 'Tidak tersedia'),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF00A4C6), // Warna latar biru
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.white, size: 20),
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
                    onTap: () {
                      final pdfUrl = data['bukti'];
                      if (pdfUrl != null && pdfUrl.isNotEmpty) {
                        _openPdf(pdfUrl, context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('File PDF tidak tersedia'),
                          ),
                        );
                      }
                    },
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
            ),
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
            ),
          ),
        ],
      ),
    );
  }
}
