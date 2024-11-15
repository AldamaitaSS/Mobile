import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker

class UploadScreen extends StatefulWidget {
  final Function(String) onFileUploaded; // Callback untuk mengembalikan path file yang diunggah

  UploadScreen({required this.onFileUploaded});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String _fileName = "Tidak ada file terpilih"; // Menyimpan nama file yang dipilih
  XFile? _selectedFile; // Menyimpan file yang dipilih

  // Fungsi untuk memilih file dari galeri
  Future<void> _pickFile() async {
    final ImagePicker _picker = ImagePicker();
    _selectedFile = await _picker.pickImage(source: ImageSource.gallery); // Membuka galeri untuk memilih file

    if (_selectedFile != null) {
      setState(() {
        _fileName = _selectedFile!.name; // Menyimpan nama file yang dipilih
      });
      widget.onFileUploaded(_selectedFile!.path); // Mengirim path file ke form_upload.dart melalui callback
    }
  }

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
          width: 350, // Lebar tampilan unggah file
          height: 450, // Tinggi tampilan unggah file
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
                    horizontal: 32.0), // Padding untuk batas putus-putus
                child: DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  dashPattern: [6, 3],
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 40,
                          color: Color(0xFF1F4C97),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: _pickFile, // Memanggil fungsi untuk memilih file
                          child: Text(
                            'Pilih berkas dari galeri',
                            style: TextStyle(
                                color: Color(0xFF1F4C97),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _fileName,
                          style: TextStyle(
                              color: _fileName == "Tidak ada file terpilih"
                                  ? Colors.red
                                  : Colors.black),
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
}
