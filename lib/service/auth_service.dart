import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> login(String nis, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nim': nis, 'password': password}),
      );

      if (response.statusCode == 200) {
        print("Login sukses");
        return true;
      } else {
        print("Login gagal");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
