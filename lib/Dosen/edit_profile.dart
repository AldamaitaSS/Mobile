import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../auth_service.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfileScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final Dio _dio = Dio();
  final ImagePicker _picker = ImagePicker();
  
  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _namaController;
  late TextEditingController _nipController;
  String? _avatar;
  bool _isLoading = false;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.userData['email']);
    _usernameController = TextEditingController(text: widget.userData['username']);
    _namaController = TextEditingController(text: widget.userData['nama']);
    _nipController = TextEditingController(text: widget.userData['nip']);
    _avatar = widget.userData['avatar'];
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75,
      );

      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memilih gambar')),
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
          'Edit Profil',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: _imageFile != null
                            ? ClipOval(
                                child: Image.file(
                                  _imageFile!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : (_avatar != null && _avatar!.isNotEmpty
                                ? ClipOval(
                                    child: Image.network(
                                      'http://127.0.0.1:8000/storage/avatars/$_avatar',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.person, size: 50, color: Colors.white);
                                      },
                                    ),
                                  )
                                : Icon(Icons.person, size: 50, color: Colors.white)),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1F4C97),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            onPressed: _pickImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildProfileField('Email', _emailController),
                SizedBox(height: 20),
                _buildProfileField('Nama Lengkap', _namaController),
                SizedBox(height: 20),
                _buildProfileField('Nama Pengguna', _usernameController),
                SizedBox(height: 20),
                _buildProfileField('NIP', _nipController),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text('Batal', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: _isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(color: Colors.white),
                            )
                          : Text('Simpan', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field ini tidak boleh kosong';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final token = await _authService.getToken();

      // Membuat form data
      final formData = FormData.fromMap({
        'email': _emailController.text,
        'username': _usernameController.text,
        'nama': _namaController.text,
        'nip': _nipController.text,
      });

      // Menambahkan file avatar jika ada
      if (_imageFile != null) {
        formData.files.add(MapEntry(
          'avatar',
          await MultipartFile.fromFile(_imageFile!.path),
        ));
      }

      final response = await _dio.post(
        'http://127.0.0.1:8000/api/user/update',
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profil berhasil diperbarui')),
        );
        Navigator.pop(context, true);
      } else {
        throw Exception('Gagal memperbarui profil');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memperbarui profil: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _namaController.dispose();
    _nipController.dispose();
    super.dispose();
  }
}