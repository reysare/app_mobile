import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/peminjaman_models.dart';

class PeminjamanService {
  final String baseUrl =
      'http://127.0.0.1:8000/api'; // ganti sesuai IP/URL server kamu

  Future<List<Peminjaman>> fetchPeminjaman(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/peminjaman'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((e) => Peminjaman.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat data peminjaman');
    }
  }

  Future<void> tambahPeminjaman(Peminjaman p, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/peminjaman'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept': 'application/json', // <--- penting ini
      },
      body: jsonEncode({
        'judul_buku': p.judulBuku,
        'tgl_pinjam': p.tglPinjam,
        'tgl_kembali': p.tglKembali,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menambahkan peminjaman');
    }
  }
}
