// service/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_models.dart';

class AuthService {
  static const String _baseUrl = 'http://127.0.0.1:8000/api';
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  // Login dengan NIS dan Password
  Future<Map<String, dynamic>> login(String nis, String password) async {
    try {
      print('Attempting login with NIS: $nis'); // Debug log
      
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'nis': nis,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['success'] == true) {
        // Simpan token dan data user
        await _saveAuthData(
          responseData['data']['token'],
          responseData['data']['anggota'],
        );

        return {
          'success': true,
          'message': 'Login berhasil',
          'user': responseData['data']['anggota'],
          'token': responseData['data']['token'],
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Login gagal',
        };
      }
    } catch (e) {
      print('Login error: $e'); // Debug log
      return {
        'success': false,
        'message': 'Koneksi gagal: ${e.toString()}',
      };
    }
  }

  // Simpan data auth ke local storage
  Future<void> _saveAuthData(String token, Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, json.encode(userData));
  }

  // Get token dari local storage
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Get user data dari local storage
  Future<Anggota?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    
    if (userData != null) {
      final userMap = json.decode(userData);
      return Anggota.fromJson(userMap);
    }
    return null;
  }

  // Check apakah user sudah login
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // Logout
  Future<Map<String, dynamic>> logout() async {
    try {
      final token = await getToken();
      
      if (token != null) {
        // Panggil API logout
        final response = await http.post(
          Uri.parse('$_baseUrl/logout'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        );
        print('Logout response: ${response.statusCode}'); // Debug log
      }

      // Hapus data dari local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_userKey);

      return {
        'success': true,
        'message': 'Logout berhasil',
      };
    } catch (e) {
      print('Logout error: $e'); // Debug log
      // Tetap hapus local storage meski API error
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_userKey);
      
      return {
        'success': true, // Tetap success karena local storage sudah dihapus
        'message': 'Logout berhasil',
      };
    }
  }

  // Get user profile dari API
  Future<Map<String, dynamic>> getProfile() async {
    try {
      final token = await getToken();
      
      if (token == null) {
        return {
          'success': false,
          'message': 'Token tidak ditemukan',
        };
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['success'] == true) {
        return {
          'success': true,
          'user': responseData['data'],
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Gagal mengambil profil',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Koneksi gagal: ${e.toString()}',
      };
    }
  }

  // Helper method untuk HTTP requests dengan authentication
  Future<Map<String, String>> _getAuthHeaders() async {
    final token = await getToken();
    return {
      'Authorization': 'Bearer ${token ?? ''}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // Test koneksi ke server
  Future<bool> testConnection() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/test'), // Endpoint test jika ada
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(Duration(seconds: 5));
      
      return response.statusCode == 200;
    } catch (e) {
      print('Connection test failed: $e');
      return false;
    }
  }
}