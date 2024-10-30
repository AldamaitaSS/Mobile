import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:dotted_border/dotted_border.dart'; // Import dotted_border package

class UploadScreen extends StatefulWidget {
  final Function(String) onFileUploaded; // Callback for returning file name

  UploadScreen({required this.onFileUploaded}); // Constructor

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String _fileName =
      "Tidak ada file terpilih"; // Variable to store selected file name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unggah Sertifikasi',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF1F4C97),
      ),
      body: Center(
        child: Container(
          width: 350, // Adjusted width of the entire pop-up
          height: 450, // Adjusted height
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0), // Padding around the dotted border
                child: DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  // radius: Radius.circular(12),
                  dashPattern: [6, 3],
                  child: Container(
                    width: double.infinity, // Fill the available width
                    padding: EdgeInsets.all(16), // Padding inside the border
                    height: 150, // Height of the dotted border
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 40, // Icon size
                          color: Color(0xFF1F4C97),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: 'Unggah berkas '),
                              TextSpan(
                                text: 'di sini',
                                style: TextStyle(
                                    color: Color(0xFF1F4C97),
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _showFileDialog(
                                        context); // Show file dialog when 'di sini' is clicked
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _fileName, // Display the selected file status
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F4C97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Text(
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
          title: Text('Berkas Contoh'),
          content: Text('Berkas contoh berhasil ditambahkan!'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _fileName = 'Berkas Contoh.txt'; // Simulate the uploaded file
                });
                widget.onFileUploaded(
                    _fileName); // Return the file name to the form
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
