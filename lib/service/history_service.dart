// history_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/history_models.dart';
import '../service/auth_service.dart';

class HistoryService {
  static const String _baseUrl = 'http://127.0.0.1:8000/api/history';

  Future<List<BorrowedBook>> fetchHistory() async {
    final authService = AuthService();
    final token = await authService.getToken();
    final currentUser = await authService.getCurrentUser();

    if (token == null || currentUser == null) {
      throw Exception("Unauthorized or no user data");
    }

    final response = await http.get(
      Uri.parse("$_baseUrl?nis=${currentUser.nis}"),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => BorrowedBook.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch history: ${response.statusCode}");
    }
  }
}
