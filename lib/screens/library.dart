import 'package:flutter/material.dart';
import '../models/book_models.dart';
import '../service/book_service.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _selectedIndex = 1;
  final List<String> _genres = ['All genre', 'Fiction', 'Romance', 'Old Classics', 'Self D'];
  final BookService _bookService = BookService();
  late Future<List<Book>> _futureBooks;

  @override
  void initState() {
    super.initState();
    _futureBooks = _bookService.fetchBooks();
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
      if (index == 0) Navigator.pushReplacementNamed(context, '/home');
      if (index == 2) Navigator.pushReplacementNamed(context, '/history');
      if (index == 3) Navigator.pushReplacementNamed(context, '/profil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildGenreSelector(),
            Expanded(
              child: FutureBuilder<List<Book>>(
                future: _futureBooks,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load books: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No books found.'));
                  } else {
                    return _buildBookGrid(snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: const [
          SizedBox(width: 8.0),
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search something...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.tune, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreSelector() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _genres.length,
        itemBuilder: (context, index) {
          final bool isSelected = index == 0;
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 16.0 : 8.0,
              right: index == _genres.length - 1 ? 16.0 : 0.0,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.white,
                foregroundColor: isSelected ? Colors.white : Colors.black,
                elevation: 0,
                side: BorderSide(color: isSelected ? Colors.blue : Colors.grey),
              ),
              child: Text(_genres[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookGrid(List<Book> books) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return _buildBookCard(books[index]);
      },
    );
  }

  Widget _buildBookCard(Book book) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/peminjaman', arguments: book);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Image.network(
                      book.coverUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.broken_image, size: 48, color: Colors.grey.shade400),
                        );
                      },
                    ),
                  ),
                ),
                if (book.isNew)
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Text('New', style: TextStyle(color: Colors.pink, fontSize: 12.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
                if (book.discount != null)
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(book.discount!, style: const TextStyle(color: Colors.purple, fontSize: 12.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          Text(book.author, style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0)),
        ],
      ),
    );
  }
}
