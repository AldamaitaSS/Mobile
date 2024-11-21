class User {
  final int id;
  final String? name;  // Ubah jadi optional dengan menambahkan ?
  
  User({
    required this.id,
    this.name,  // Hapus required
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}