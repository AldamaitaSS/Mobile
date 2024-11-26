import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1565C0),
        title: Text('Statistik'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildCircularProgress(),
                  SizedBox(height: 20),
                  _buildStatGrid(),
                ],
              ),
            ),
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: 1,
            strokeWidth: 10,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1565C0)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '120',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'Jumlah sertifikat tahun 2024',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
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
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('Bulan ini', '100', 'Sertifikasi'),
        _buildStatCard('Bulan lalu', '80', 'Sertifikasi'),
        _buildStatCard('Peningkatan', '20', 'Sertifikasi'),
        _buildStatCard('Penurunan', '0', 'Sertifikasi'),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, false),
          _buildNavItem(Icons.bar_chart, true),
          _buildNavItem(Icons.notifications, false),
          _buildNavItem(Icons.person, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Icon(
      icon,
      color: isActive ? Color(0xFF1565C0) : Colors.grey,
      size: 30,
    );
  }
}