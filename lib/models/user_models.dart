// models/anggota.dart
class Anggota {
  final int id;
  final String name;
  final String password;
  final String nis;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Anggota({
    required this.id,
    required this.name,
    required this.password,
    required this.nis,
    this.createdAt,
    this.updatedAt,
  });

  factory Anggota.fromJson(Map<String, dynamic> json) {
    return Anggota(
      id: json['id'],
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      nis: json['nis'] ?? '',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'nis': nis,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Getter untuk kompatibilitas dengan kode yang sudah ada
  String get nama => name;
}