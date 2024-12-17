<<<<<<< HEAD
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:dio/dio.dart';
// import '../auth_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Upload',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: UploadScreen(
//         onFileUploaded: (String fileName) {
//           // Dummy callback, not used in main app
//         },
//       ),
//     );
//   }
// }

// class UploadScreen extends StatefulWidget {
//   final Function(String) onFileUploaded; // Callback untuk mengembalikan nama file

//   UploadScreen({required this.onFileUploaded}); // Constructor

//   @override
//   _UploadScreenState createState() => _UploadScreenState();
// }

// class _UploadScreenState extends State<UploadScreen> {
  
//   final Dio _dio = Dio();
//   final String baseUrl = 'http://127.0.0.1:8000/api';
//   final AuthService _authService = AuthService();

//   String _fileName = "Tidak ada file terpilih"; // Variabel untuk menyimpan nama file

//   @override
//   void initState() {
//     super.initState();
//     _loadUpload();
//   }

//   Future<void> _loadUpload() async {
//     try {
//       setState(() => _isLoading = true);

//       final token = await _authService.getToken();
//       print('Debug - Token: $token');

//       if (token == null) throw Exception('Token not found');

//       final response = await _dio.get(
//         '$baseUrl/user',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       print('Debug - Response: ${response.data}');

//       if (response.statusCode == 200 && response.data['success']) {
//         final userData = response.data['user'];
//         setState(() {
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load profile');
//       }
//     } catch (e) {
//       print('Debug - Error: $e');
//       setState(() => _isLoading = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Gagal memuat data profil')),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Data',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Color(0xFF1F4C97),
//       ),
//       body: _isLoading
//       ? Center(child: CircularProgressIndicator())
//       : RefreshIndicator (
//         onRefresh:_loadUpload,
//         children: [
//           CircleAvatar(
//         child: Container(
//           width: 350,
//           height: 450,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 5,
//                 blurRadius: 10,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Unggah File',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: 300,
//                 height: 250,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.cloud_upload,
//                         size: 50,
//                         color: Color(0xFF1F4C97),
//                       ),
//                       SizedBox(height: 10),
//                       RichText(
//                         text: TextSpan(
//                           style: TextStyle(color: Colors.black),
//                           children: [
//                             TextSpan(text: 'Unggah berkas '),
//                             TextSpan(
//                               text: 'di sini',
//                               style: TextStyle(color: Color(0xFF1F4C97), fontWeight: FontWeight.bold),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   _showFileDialog(context); // Tampilkan dialog berkas saat 'di sini' diklik
//                                 },
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         _fileName, // Menampilkan status file yang terpilih
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF1F4C97),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                 ),
//                 child: Text(
//                   'Simpan',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.black.withOpacity(0.5),
//     );
//   }

//   void _showFileDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Berkas Contoh'),
//           content: Text('Berkas contoh berhasil ditambahkan!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _fileName = 'Berkas Contoh.txt'; // Simulasi berkas yang diunggah
//                 });
//                 widget.onFileUploaded(_fileName); // Mengembalikan nama file ke form
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import '../auth_service.dart';

class UploadScreen extends StatefulWidget {
  final Function(String) onFileUploaded;

  UploadScreen({required this.onFileUploaded});
=======
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadScreen(
        onFileUploaded: (String fileName) {
          // Dummy callback, not used in main app
        },
      ),
    );
  }
}

class UploadScreen extends StatefulWidget {
  final Function(String) onFileUploaded; // Callback untuk mengembalikan nama file

  const UploadScreen({super.key, required this.onFileUploaded}); // Constructor
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
<<<<<<< HEAD
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api';
  final AuthService _authService = AuthService();

  String _fileName = "Tidak ada file terpilih";
  Uint8List? _fileBytes;
  bool _isLoading = false;

  Future<void> _pickFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _fileBytes = result.files.single.Bytes;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak ada file yang dipilih')),
      );
    }
  } catch (e) {
    print('Error picking file: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal memilih file')),
    );
  }
}

Future<void> _uploadFile() async {
  if (_selectedFile == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tidak ada file yang dipilih')),
    );
    return;
  }

  try {
    final token = await _authService.getToken();
    if (token == null) throw Exception('Token not found');

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(_selectedFile!.path,
          filename: _fileName),
    });

    final response = await _dio.post(
      '$baseUrl/upload',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200 && response.data['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File berhasil diunggah')),
      );
      widget.onFileUploaded(_fileName);
    } else {
      throw Exception('Gagal mengunggah file');
    }
  } catch (e) {
    print('Debug - Upload Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal mengunggah file')),
    );
  }
}
=======
  String _fileName = "Tidak ada file terpilih"; // Variabel untuk menyimpan nama file
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(
=======
        title: const Text(
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          'Data',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
<<<<<<< HEAD
          icon: Icon(Icons.arrow_back, color: Colors.white),
=======
          icon: const Icon(Icons.arrow_back, color: Colors.white),
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
          onPressed: () {
            Navigator.pop(context);
          },
        ),
<<<<<<< HEAD
        backgroundColor: Color(0xFF1F4C97),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      height: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Unggah File',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: _pickFile,
                            child: Container(
                              width: 300,
                              height: 250,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload,
                                      size: 50,
                                      color: Color(0xFF1F4C97),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      _fileName,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _uploadFile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1F4C97),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                            ),
                            child: Text(
                              'Unggah',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

=======
        backgroundColor: const Color(0xFF1F4C97),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Unggah File',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 50,
                        color: Color(0xFF1F4C97),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            const TextSpan(text: 'Unggah berkas '),
                            TextSpan(
                              text: 'di sini',
                              style: const TextStyle(color: Color(0xFF1F4C97), fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _showFileDialog(context); // Tampilkan dialog berkas saat 'di sini' diklik
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _fileName, // Menampilkan status file yang terpilih
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F4C97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.5),
    );
  }

  void _showFileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berkas Contoh'),
          content: const Text('Berkas contoh berhasil ditambahkan!'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _fileName = 'Berkas Contoh.txt'; // Simulasi berkas yang diunggah
                });
                widget.onFileUploaded(_fileName); // Mengembalikan nama file ke form
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
>>>>>>> cc6aa6fab2f9df8bec982b4f8429905c27d73e98
}
