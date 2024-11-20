import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';

// Import navigasi untuk dosen dan pimpinan
import 'dosen/navigasi.dart' as dosenNavigasi;
import 'pimpinan/navigasi.dart' as pimpinanNavigasi;

final dio = Dio();

String urlDomain = "http://192.168.1.49:8000/";
String urlLogin = urlDomain + "api/login";

// Fungsi login untuk memverifikasi kredensial pengguna
Future<void> login(String username, String password, BuildContext context) async {
  try {
    final response = await dio.post(
      urlLogin,
      data: {
        'username': username,
        'password': password,
      },
    );

    // Periksa respons dari server
    if (response.statusCode == 200) {
      
      String role = username.toLowerCase();
      Widget destinationPage = role == 'pimpinan'
          ? pimpinanNavigasi.Navigasi()
          : dosenNavigasi.Navigasi();

      // Navigasi ke halaman HomeScreen dengan halaman tujuan yang tepat
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(destinationPage: destinationPage),
        ),
      );
    } else {
      // Tampilkan pesan error jika login gagal
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Gagal"),
            content: Text("Username atau Password salah."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    // Tampilkan dialog error jika ada masalah koneksi atau lainnya
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Gagal terhubung ke server."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistem Sertifikasi',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SISTEM SERTIFIKASI',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 170),
              Image.asset(
                'assets/logo_polinema.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 170),
              Text(
                'JTI POLINEMA',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            'assets/logo_polinema.png',
                            width: 70,
                            height: 70,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'JTI POLINEMA',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F4C97),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                login(usernameController.text, passwordController.text, context);
                              },
                              child: Text('LOGIN'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1F4C97),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Widget destinationPage;

  const HomeScreen({Key? key, required this.destinationPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: destinationPage,
    );
  }
}
