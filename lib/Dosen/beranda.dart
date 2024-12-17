import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:dio/dio.dart';
import '../auth_service.dart';
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
import 'total_sertif.dart';
import 'list_pelatihan.dart';
import 'list_sertifikasi.dart';

<<<<<<< HEAD
class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);
=======
class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final Dio _dio = Dio();
  final AuthService _authService = AuthService();

  final String baseUrl = 'http://127.0.0.1:8000/api';
  final String _sertifikasiUrl = 'http://127.0.0.1:8000/api/sertifikasi';
  final String _pelatihanUrl = 'http://127.0.0.1:8000/api/pelatihan';
  final String _jumlahSertifikatUrl =
      'http://127.0.0.1:8000/api/jumlah-sertifikat';

  String? _nama;
  String? _avatar;
  int _jumlahSertifikasi = 0;
  int _jumlahPelatihan = 0;
  int _jumlahSertifikat = 0;
  bool _isLoading = true;
  bool _isLoadingSertifikasi = true;
  bool _isLoadingPelatihan = true;
  bool _isLoadingSertifikat = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _fetchData();
  }

  Future<void> _loadUserProfile() async {
    try {
      setState(() => _isLoading = true);

      final token = await _authService.getToken();
      if (token == null) throw Exception('Token not found');

      final response = await _dio.get(
        '$baseUrl/user',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['success']) {
        final userData = response.data['user'];
        setState(() {
          _nama = userData['nama'];
          _avatar = userData['avatar'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      print('Error: $e');
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat data pengguna')),
      );
    }
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoadingSertifikasi = true;
      _isLoadingPelatihan = true;
      _isLoadingSertifikat = true;
    });
    await Future.wait([
      _fetchJumlahSertifikasi(),
      _fetchJumlahPelatihan(),
      _fetchJumlahSertifikat(),
    ]);
  }

  Future<void> _fetchJumlahSertifikasi() async {
    try {
      final response = await _dio.get(_sertifikasiUrl);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        setState(() {
          _jumlahSertifikasi = data.length;
          _isLoadingSertifikasi = false;
        });
      } else {
        throw Exception('Gagal memuat data sertifikasi');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoadingSertifikasi = false;
      });
    }
  }

  Future<void> _fetchJumlahPelatihan() async {
    try {
      final response = await _dio.get(_pelatihanUrl);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        setState(() {
          _jumlahPelatihan = data.length;
          _isLoadingPelatihan = false;
        });
      } else {
        throw Exception('Gagal memuat data pelatihan');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoadingPelatihan = false;
      });
    }
  }

  Future<void> _fetchJumlahSertifikat() async {
    try {
      // Mendapatkan token dari AuthService
      final authService = AuthService();
      final token = await authService.getToken();
      if (token == null) throw Exception('Token not found');

      // Melakukan permintaan API dengan header Authorization
      final response = await _dio.get(
        _jumlahSertifikatUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Memproses respons API
      if (response.statusCode == 200) {
        setState(() {
          _jumlahSertifikat = response.data['jumlah_sertifikat'];
          _isLoadingSertifikat = false;
        });
      } else {
        print('Failed to load jumlah sertifikat with status: ${response.statusCode}');
        throw Exception('Gagal memuat jumlah sertifikat');
      }
    } catch (e) {
      // Menangani error
      print('Error: $e');
      setState(() {
        _isLoadingSertifikat = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat jumlah sertifikat')),
      );
    }
  }
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C97),
        foregroundColor: Colors.white,
        title: Row(
          children: [
<<<<<<< HEAD
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFD3D3D3),
              child: Icon(Icons.person, color: Color(0xFF1F4C97), size: 30),
=======
            CircleAvatar(
              radius: 18, // Increased from 18 to match profile screen
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: _avatar != null && _avatar!.isNotEmpty
                    ? Image.network(
                        'http://127.0.0.1:8000/storage/photos/$_avatar',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes!)
                                  : null,
                            ),
                          );
                        },
                      )
                    : Icon(
                        Icons.person,
                        size: 18,
                        color: Colors.white,
                      ),
              ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
<<<<<<< HEAD
                children: const [
                  Text(
                    'Halo, Dr.Eng. Rosa Andire Asmara, ST, MT',
                    style: TextStyle(
=======
                children: [
                  Text(
                    _isLoading ? 'Memuat...' : 'Halo, $_nama',
                    style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
<<<<<<< HEAD
                  Text(
=======
                  const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                    'Selamat datang di Sistem Sertifikasi',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE6E6E6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
<<<<<<< HEAD
      ),
      backgroundColor: Color(0xFF1F4C97),
=======
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchData,
            tooltip: 'Perbarui Data',
          ),
        ],
      ),
      backgroundColor: const Color(0xFF1F4C97),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildTitle(),
      ),
    );
  }

  Widget _buildTitle() {
<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
=======
    return const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          SizedBox(height: 15),
          Text(
            'Sistem Sertifikasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Politeknik Negeri Malang',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildDosenCard(context),
          Expanded(
            child: _buildCategorySection(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDosenCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFEDF6FF),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Jumlah Sertifikat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF494949),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
<<<<<<< HEAD
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                    '10',
                    style: TextStyle(
=======
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    _isLoadingSertifikat ? '' : '$_jumlahSertifikat',
                    style: const TextStyle(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      fontSize: 60,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF494949),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _navigateToTotalSertif(context),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Lihat sertifikat anda',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.withOpacity(0.6),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0),
              child: const SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage('asset/sertifikat.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Kategori',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryCard(
                context,
<<<<<<< HEAD
                'Sertifikasi\nTersedia',
                Icons.verified,
                '10',
=======
                'Sertifikasi',
                Icons.verified,
                _jumlahSertifikasi,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                () => _navigateToListSertifikasi(context),
              ),
              _buildCategoryCard(
                context,
<<<<<<< HEAD
                'Pelatihan\nTersedia',
                Icons.school,
                '10',
=======
                'Pelatihan',
                Icons.school,
                _jumlahPelatihan,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                () => _navigateToListPelatihan(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

<<<<<<< HEAD
  Widget _buildCategoryCard(BuildContext context, String title, IconData icon,
      String count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        child: Card(
          elevation: 4,
          color: const Color(0xFFEDF6FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40, color: Colors.blue),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
=======
  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    int count,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          color: const Color(0xFFEDF6FF),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color(0xFF1F4C97),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F4C97),
              ),
            ),
          ],
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        ),
      ),
    );
  }

  void _navigateToTotalSertif(BuildContext context) {
    Navigator.push(
      context,
<<<<<<< HEAD
      MaterialPageRoute(builder: (context) => const TotalSertifikasi()),
    );
  }

  void _navigateToListSertifikasi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListSertifikasiPage()),
=======
      MaterialPageRoute(
        builder: (context) => const TotalSertifikasi(),
      ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    );
  }

  void _navigateToListPelatihan(BuildContext context) {
    Navigator.push(
      context,
<<<<<<< HEAD
      MaterialPageRoute(builder: (context) => const ListPelatihanPage()),
=======
      MaterialPageRoute(
        builder: (context) => const ListPelatihanPage(),
      ),
    );
  }

  void _navigateToListSertifikasi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ListSertifikasiPage(),
      ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    );
  }
}
