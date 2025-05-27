import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Tambahkan ini
import '../models/book_models.dart';

class BookService {
  final String baseUrl = 'http://127.0.0.1:8000/api';
  String? token;

  // Set token secara manual (opsional)
  void setToken(String newToken) {
    token = newToken;
  }

  // Ambil token dari SharedPreferences jika belum ada
  Future<void> _loadTokenIfNeeded() async {
    if (token == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
    }
  }

  Future<List<Book>> fetchBooks() async {
    try {
      await _loadTokenIfNeeded(); // Pastikan token terisi dulu

      final response = await http.get(
        Uri.parse('$baseUrl/buku'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body);

        if (body is List) {
          return body.map((item) => Book.fromJson(item)).toList();
        } else if (body['data'] != null) {
          final List<dynamic> data = body['data'];
          return data.map((item) => Book.fromJson(item)).toList();
        } else {
          throw Exception('Unexpected response format: ${response.body}');
        }
      } else {
        throw Exception(
          'Failed to load books. Status: ${response.statusCode}\n'
          'Response: ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch books: $e');
    }
  }

  Future<void> addBook(Book book) async {
    try {
      await _loadTokenIfNeeded();

      final response = await http.post(
        Uri.parse('$baseUrl/buku'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(book.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception(
          'Failed to add book. Status: ${response.statusCode}\n'
          'Response: ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Failed to add book: $e');
    }
  }

  Future<Book> getBook(int id) async {
    await _loadTokenIfNeeded();

    final response = await http.get(
      Uri.parse('$baseUrl/buku/$id'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return Book.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load book');
    }
  }

  Future<void> updateBook(int id, Book book) async {
    await _loadTokenIfNeeded();

    final response = await http.put(
      Uri.parse('$baseUrl/buku/$id'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(book.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(int id) async {
    await _loadTokenIfNeeded();

    final response = await http.delete(
      Uri.parse('$baseUrl/buku/$id'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }
}
