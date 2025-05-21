import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_models.dart';

class BookService {
  final String baseUrl = 'http://127.0.0.1:8000/api/books';

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
