import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_models.dart';

class ProfileService {
  final String baseUrl = 'http://127.0.0.1:8000/api'; // Ganti sesuai IP kamu

  Future<Profile?> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      print('Token: $token');

      if (token.isEmpty) {
        throw Exception('Token tidak ditemukan');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        return Profile.fromJson(jsonBody); // DI SINI LO PASS JSON PENUH
      } else {
        print('Gagal ambil profil: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error saat ambil profil: $e');
      return null;
    }
  }
}
