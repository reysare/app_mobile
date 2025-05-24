

import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _selectedIndex = 1;

  final List<String> _genres = [
    'All genre',
    'Fiction',
    'Romance',
    'Old Classics',
    'Self D',
  ];

  final List<Map<String, dynamic>> _books = [
    {
      'title': 'Atomic Habits',
      'author': 'James Clear',
      'coverUrl':
          'https://images-na.ssl-images-amazon.com/images/I/91bYsX41DVL.jpg',
      'isNew': true,
    },
    {
      'title': 'Sapiens',
      'author': 'Yuval Noah Harari',
      'coverUrl':
          'https://images-na.ssl-images-amazon.com/images/I/713jIoMO3UL.jpg',
      'isNew': false,
      'subtitle': 'Riwayat\nSingkat\nUmat Manusia',
    },
    {
      'title': 'Si Putih',
      'author': 'Robert T. Kiyosaki',
      'coverUrl':
          'https://cdn.gramedia.com/uploads/items/9786020523310_Si_Putih.jpg',
      'isNew': true,
    },
    {
      'title': 'Bintang',
      'author': 'Tere Liye',
      'coverUrl':
          'https://cdn.gramedia.com/uploads/items/9786020624352_Bintang.jpg',
      'isNew': false,
      'discount': '70%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildHomePage(),
            _buildBooksPage(),
            _buildHistoryPage(),
            _buildProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHomePage() {
    return Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBooksPage() {
    return Column(
      children: [
        _buildSearchBar(),
        _buildGenreSelector(),
        Expanded(child: _buildBookGrid()),
      ],
    );
  }

  Widget _buildHistoryPage() {
    return Center(
      child: Text(
        'History Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProfilePage() {
    return Center(
      child: Text(
        'Account Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
        children: [
          const SizedBox(width: 8.0),
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8.0),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search something...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.blue.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
            ),
            child: const Icon(Icons.tune, color: Colors.blue),
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
                side: BorderSide(
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
              child: Text(_genres[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: _books.length,
      itemBuilder: (context, index) {
        final book = _books[index];
        return _buildBookCard(book);
      },
    );
  }

  Widget _buildBookCard(Map<String, dynamic> book) {
    return Column(
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
                    book['coverUrl'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.book,
                                size: 50, color: Colors.grey.shade400),
                            const SizedBox(height: 8),
                            Text(
                              book['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (book['isNew'] == true)
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      'New',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (book['discount'] != null)
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      book['discount'],
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          book['title'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          book['author'],
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

 Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        
        // Handle navigation between screens
        if (index == 0) {
          // Navigate to Home
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1) {
          // We're already on Books page, no navigation needed
        } else if (index == 2) {
          // Navigate to History page
          Navigator.pushReplacementNamed(context, '/history');
        } else if (index == 3) {
          // Navigate to Account page
          Navigator.pushReplacementNamed(context, '/profil');
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}
