import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/history_models.dart';

class HistoryService {
  static const String baseUrl =
      'http://127.0.0.1:8000/api'; // Ganti jika berbeda

  static Future<List<BorrowedBook>> getHistory() async {
    final response = await http.get(Uri.parse('$baseUrl/history'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => BorrowedBook.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load history');
    }
  }
}
