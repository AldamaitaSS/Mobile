import 'package:flutter/material.dart';
import '../Pimpinan/beranda.dart';
<<<<<<< HEAD
import '../Pimpinan/notifikasi.dart';
=======
// import '../Pimpinan/notifikasi.dart';
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
import '../Pimpinan/profile.dart';
import '../Pimpinan/statistik.dart'; // Tambahkan import statistik

class Navigasi extends StatefulWidget {
  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    BerandaPage(),
    ChartPage(), 
<<<<<<< HEAD
    NotifikasiPage(),
=======
    // NotifikasiPage(),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1F4C97),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), // Icon untuk statistik
              label: 'Statistik',
            ),
<<<<<<< HEAD
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: 'Notifikasi',
            ),
=======
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.notifications_active),
            //   label: 'Notifikasi',
            // ),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          backgroundColor: Colors.transparent,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.6),
            size: 24,
          ),
        ),
      ),
    );
  }
}
