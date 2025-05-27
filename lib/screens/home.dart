import 'package:flutter/material.dart';

class BookstoreHomePage extends StatefulWidget {
  const BookstoreHomePage({Key? key}) : super(key: key);

  @override
  State<BookstoreHomePage> createState() => _BookstoreHomePageState();
}

class _BookstoreHomePageState extends State<BookstoreHomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _manualBooks = [
    {
      'title': 'Si Putih',
      'author': 'Tere Liye',
      'description': 'Petualangan seru di dunia paralel...',
      'image': 'assets/images/si_putih.jpg',
      'color': Colors.teal,
    },
    {
      'title': 'Selena',
      'author': 'Tere Liye',
      'description':
          'Buku prekuel serial dunia paralel yang menceritakan tentang orang tua Raib...',
      'image': 'assets/images/2.png',
      'color': Colors.purple,
    },
    {
      'title': 'Atomic Habits',
      'author': 'James Clear',
      'description':
          'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
      'image': 'assets/images/3.png',
      'color': Colors.orange,
    },
  ];

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
                    'Welcome back, Jen!',
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
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Category Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Category',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('This month',
                          style: TextStyle(color: Colors.white)),
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

            // Manual Book List
            Expanded(
              child: ListView.builder(
                itemCount: _manualBooks.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final manual = _manualBooks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildBookCard(
                      title: manual['title'],
                      author: manual['author'],
                      description: manual['description'],
                      bookImage: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          manual['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100,
                        ),
                      ),
                      color: manual['color'],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
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
              icon: Icon(Icons.account_circle), label: 'Account'),
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

  Widget _buildBookCard({
    required String title,
    required String author,
    required String description,
    required Widget bookImage,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/peminjaman',
          arguments: {
            'title': title,
            'author': author,
            'description': description,
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
              child: bookImage,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Goodreads',
                style: TextStyle(
                  fontSize: 10,
                  color: color,
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
