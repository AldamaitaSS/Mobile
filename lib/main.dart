import 'package:flutter/material.dart';
// Menambahkan prefix untuk menghindari konflik
import 'dosen/navigasi.dart' as dosenNavigasi;
import 'pimpinan/navigasi.dart' as pimpinanNavigasi;
import 'dart:async';
import 'auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
=======
  const MyApp({super.key});

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistem Sertifikasi',
      theme: ThemeData(
        fontFamily: 'Poppins', // Set Poppins as the default font
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
<<<<<<< HEAD
=======
  const SplashScreen({super.key});

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    Timer(Duration(seconds: 5), () {
=======
    Timer(const Duration(seconds: 5), () {
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
<<<<<<< HEAD
        decoration: BoxDecoration(
=======
        decoration: const BoxDecoration(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
<<<<<<< HEAD
                      Text(
=======
                      const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        'SISTEM SERTIFIKASI',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(height: 170),
=======
                      const SizedBox(height: 170),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      Image.asset(
                        'asset/logo_polinema.png',
                        width: 100,
                        height: 100,
                      ),
<<<<<<< HEAD
                      SizedBox(height: 170),
                      Text(
=======
                      const SizedBox(height: 170),
                      const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        'JTI POLINEMA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
=======
                const Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

<<<<<<< HEAD
// class LoginPage extends StatelessWidget {
//   final TextEditingController _nipController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthService _authService = AuthService();

//   void _login(BuildContext context) async {
//     final nip = _nipController.text;
//     final password = _passwordController.text;

//     // Call the login API
//     final result = await _authService.login(nip, password);

//     if (result != null) {
//       // Extract user data from the response
//       final userLevel = result['user']['level_id'];
//       final username = result['user']['username'];

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login successful! Welcome $username')),
//       );

//       // Navigate based on user level
//       if (userLevel == 2) {
//         // Navigate to Pimpinan dashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => pimpinanNavigasi.Navigasi()),
//         );
//       } else if (userLevel == 3) {
//         // Navigate to Dosen dashboard
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => dosenNavigasi.Navigasi()),
//         );
//       } else {
//         // Show an error message if the user level is not recognized
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('User level not recognized.')),
//         );
//       }
//     } else {
//       // Show error message if login fails
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid NIP or password. Please try again.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           SizedBox(height: 10),
//                           Image.asset(
//                             'asset/logo_polinema.png',
//                             width: 70,
//                             height: 70,
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             'JTI POLINEMA',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1F4C97),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           TextField(
//                             controller: _nipController,
//                             decoration: InputDecoration(
//                               hintText: 'NIP',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 15),
//                           TextField(
//                             controller: _passwordController,
//                             decoration: InputDecoration(
//                               hintText: 'Password',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                             obscureText: true,
//                           ),
//                           SizedBox(height: 30),
//                           ElevatedButton(
//                             onPressed: () => _login(context),
//                             child: Text('LOGIN'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF1F4C97),
//                               foregroundColor: Colors.white,
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class LoginPage extends StatefulWidget {
=======
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool _obscureText = true;

  void _login(BuildContext context) async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
        SnackBar(content: Text('Username dan Password harus diisi')),
=======
        const SnackBar(content: Text('Username dan Password harus diisi')),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _authService.login(
        _usernameController.text,
        _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (result != null && result['success'] == true) {
        final userLevel = result['user']['level']['id'];
        final nama = result['user']['nama'];

<<<<<<< HEAD
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil! Selamat datang $nama')),
        );

=======
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        switch (userLevel) {
          case 2: // Pimpinan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => pimpinanNavigasi.Navigasi()),
            );
            break;
          case 3: // Dosen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => dosenNavigasi.Navigasi()),
            );
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
              SnackBar(content: Text('Level pengguna tidak dikenali')),
=======
              const SnackBar(content: Text('Level pengguna tidak dikenali')),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
            );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
          SnackBar(content: Text('Username atau Password salah')),
=======
          const SnackBar(content: Text('Username atau Password salah')),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
        SnackBar(content: Text('Terjadi kesalahan. Silakan coba lagi')),
=======
        const SnackBar(content: Text('Terjadi kesalahan. Silakan coba lagi')),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
<<<<<<< HEAD
        decoration: BoxDecoration(
=======
        decoration: const BoxDecoration(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
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
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
<<<<<<< HEAD
                      SizedBox(height: 10),
=======
                      const SizedBox(height: 10),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      Image.asset(
                        'asset/logo_polinema.png',
                        width: 70,
                        height: 70,
                      ),
<<<<<<< HEAD
                      SizedBox(height: 15),
                      Text(
=======
                      const SizedBox(height: 15),
                      const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                        'JTI POLINEMA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F4C97),
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(height: 20),
=======
                      const SizedBox(height: 20),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon:
<<<<<<< HEAD
                              Icon(Icons.person, color: Color(0xFF1F4C97)),
=======
                              const Icon(Icons.person, color: Color(0xFF1F4C97)),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(height: 15),
=======
                      const SizedBox(height: 15),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon:
<<<<<<< HEAD
                              Icon(Icons.lock, color: Color(0xFF1F4C97)),
=======
                              const Icon(Icons.lock, color: Color(0xFF1F4C97)),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
<<<<<<< HEAD
                              color: Color(0xFF1F4C97),
=======
                              color: const Color(0xFF1F4C97),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(height: 30),
=======
                      const SizedBox(height: 30),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : () => _login(context),
                          style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                            backgroundColor: Color(0xFF1F4C97),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: _isLoading
                              ? SizedBox(
=======
                            backgroundColor: const Color(0xFF1F4C97),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: _isLoading
                              ? const SizedBox(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
<<<<<<< HEAD
                              : Text(
                                  'LOGIN',
                                  style: TextStyle(
=======
                              : const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
<<<<<<< HEAD
}
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:provider/provider.dart';
// import 'providers/auth_provider.dart';

// // Import navigasi untuk dosen dan pimpinan
// import 'dosen/navigasi.dart' as dosenNavigasi;
// import 'pimpinan/navigasi.dart' as pimpinanNavigasi;

// final dio = Dio();

// String urlDomain = "http://192.168.1.49:8000/";
// String urlLogin = urlDomain + "api/login";

// // Fungsi login untuk memverifikasi kredensial pengguna
// Future<void> login(String username, String password, BuildContext context) async {
//   try {
//     final response = await dio.post(
//       urlLogin,
//       data: {
//         'username': username,
//         'password': password,
//       },
//     );

//     // Periksa respons dari server
//     if (response.statusCode == 200) {
      
//       String role = username.toLowerCase();
//       Widget destinationPage = role == 'pimpinan'
//           ? pimpinanNavigasi.Navigasi()
//           : dosenNavigasi.Navigasi();

//       // Navigasi ke halaman HomeScreen dengan halaman tujuan yang tepat
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(destinationPage: destinationPage),
//         ),
//       );
//     } else {
//       // Tampilkan pesan error jika login gagal
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Login Gagal"),
//             content: Text("Username atau Password salah."),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   } catch (e) {
//     // Tampilkan dialog error jika ada masalah koneksi atau lainnya
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text("Gagal terhubung ke server."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Sistem Sertifikasi',
//       theme: ThemeData(
//         fontFamily: 'Poppins',
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => LoginPage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'SISTEM SERTIFIKASI',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 170),
//               Image.asset(
//                 'assets/logo_polinema.png',
//                 width: 100,
//                 height: 100,
//               ),
//               SizedBox(height: 170),
//               Text(
//                 'JTI POLINEMA',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 40),
//               CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF1F4C97), Color(0xFF1F4C97)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           SizedBox(height: 10),
//                           Image.asset(
//                             'assets/logo_polinema.png',
//                             width: 70,
//                             height: 70,
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             'JTI POLINEMA',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1F4C97),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             'Log in',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           TextField(
//                             controller: usernameController,
//                             decoration: InputDecoration(
//                               hintText: 'Username',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 15),
//                           TextField(
//                             controller: passwordController,
//                             decoration: InputDecoration(
//                               hintText: 'Password',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                             obscureText: true,
//                           ),
//                           SizedBox(height: 30),
//                           SizedBox(
//                             width: 100,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 login(usernameController.text, passwordController.text, context);
//                               },
//                               child: Text('LOGIN'),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF1F4C97),
//                                 foregroundColor: Colors.white,
//                                 padding: EdgeInsets.symmetric(vertical: 10),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   final Widget destinationPage;

//   const HomeScreen({Key? key, required this.destinationPage}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: destinationPage,
//     );
//   }
// }
=======
}
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
