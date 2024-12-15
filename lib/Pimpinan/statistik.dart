import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../auth_service.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api';
  bool _isLoading = true;
  Map<String, dynamic> _statistics = {};

  @override
  void initState() {
    super.initState();
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    try {
      final token = await AuthService().getToken();
      if (token == null) throw Exception('Token not found');

      print('Loading statistics...');
      final response = await _dio.get(
        '$baseUrl/statistics',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 && response.data['success']) {
        setState(() {
          _statistics = response.data['data'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load statistics');
      }
    } catch (e) {
      print('Error loading statistics: $e');
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memuat data statistik'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1F4C97),
        title: Text(
          'Statistik',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadStatistics,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _buildCircularProgress(_statistics['total_tahun_ini'] ?? 0),
                    SizedBox(height: 20),
                    _buildStatGrid(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildCircularProgress(int total) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 15,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1F4C97)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                total.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F4C97),
                ),
              ),
              Text(
                'Jumlah sertifikat tahun ${_statistics['tahun'] ?? DateTime.now().year}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(
          'Bulan ${_statistics['bulan_sekarang'] ?? ''}',
          _statistics['bulan_ini']?.toString() ?? '0',
        ),
        _buildStatCard(
          'Bulan ${_statistics['bulan_kemarin'] ?? ''}',
          _statistics['bulan_lalu']?.toString() ?? '0',
        ),
        _buildStatCard(
            'Peningkatan', _statistics['peningkatan']?.toString() ?? '0'),
        _buildStatCard(
            'Penurunan', _statistics['penurunan']?.toString() ?? '0'),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1F4C97),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Sertifikasi',
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
