import 'package:app_mobile/models/book_models.dart';
import 'package:app_mobile/service/book_service.dart';
import 'package:flutter/material.dart';

class BookstoreHomePage extends StatefulWidget {
  const BookstoreHomePage({Key? key}) : super(key: key);

  @override
  State<BookstoreHomePage> createState() => _BookstoreHomePageState();
}

class _BookstoreHomePageState extends State<BookstoreHomePage> {
  List<Book> _books = [];
  bool _isLoading = true;
  int _selectedIndex = 0;

  // Map untuk mencocokkan judul buku dengan asset gambar
  final Map<String, String> _bookCovers = {
    'atomic habbits': 'assets/images/1.png',
    'selena': 'assets/images/2.png',
    // Tambahkan mapping lainnya sesuai dengan buku yang ada
  };

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  void _loadBooks() async {
    try {
      final books = await BookService().fetchBooks();
      setState(() {
        _books = books;
        _isLoading = false;
      });
    } catch (e) {
      print("Gagal fetch buku: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method untuk mendapatkan asset path berdasarkan judul buku
  String? _getBookCoverAsset(String bookTitle) {
    final normalizedTitle = bookTitle.toLowerCase().trim();
    return _bookCovers[normalizedTitle];
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/library');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/history');
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/profil');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.grey),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Category Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Category Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'This month',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Biology'),
                    _buildCategoryChip('Technology'),
                    _buildCategoryChip('Politics'),
                    _buildCategoryChip('Sales'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            _isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                  child: ListView.builder(
                    itemCount: _books.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      final book = _books[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _buildBookCard(book),
                      );
                    },
                  ),
                ),

            const SizedBox(height: 20),

            // Our Recommendation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Our Recommendation',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Genre Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'All genre',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Fiction'),
                    _buildCategoryChip('Romance'),
                    _buildCategoryChip('Old Classics'),
                    _buildCategoryChip('Self-'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Recommendation Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/peminjaman',
                    arguments: {
                      'title': 'Atomic Habits',
                      'author': 'James Clear',
                      'description':
                          'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
                      'imageUrl': 'assets/images/1.png',
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/1.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Atomic Habits',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'New',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.restore), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(label, style: TextStyle(color: Colors.grey[700])),
    );
  }

  Widget _buildBookCard(Book book) {
    final assetPath = _getBookCoverAsset(book.judul);
    
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/peminjaman',
          arguments: {
            'title': book.judul,
            'author': book.penulis,
            'description': book.sinopsis,
            'imageUrl': assetPath ?? book.gambar,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: assetPath != null
                    ? Image.asset(
                        assetPath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.blueAccent.withOpacity(0.8),
                            child: const Icon(
                              Icons.book,
                              size: 50,
                              color: Colors.white,
                            ),
                          );
                        },
                      )
                    : book.gambar.isNotEmpty
                        ? Image.network(
                            book.gambar,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.blueAccent.withOpacity(0.8),
                                child: const Icon(
                                  Icons.book,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.blueAccent.withOpacity(0.8),
                            child: const Icon(
                              Icons.book,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              book.judul,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              book.sinopsis,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Goodreads',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}