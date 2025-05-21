import 'package:flutter/material.dart';

class BookstoreHomePage extends StatefulWidget {
  const BookstoreHomePage({Key? key}) : super(key: key);

  @override
  State<BookstoreHomePage> createState() => _BookstoreHomePageState();
}

class _BookstoreHomePageState extends State<BookstoreHomePage> {
  int _selectedIndex = 0;

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

  void _navigateToBookDetail(Map<String, dynamic> book) {
    Navigator.pushNamed(
      context, 
      '/peminjaman', 
      arguments: book
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF505A76),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBookCard({
    required String title,
    required String author,
    required String description,
    required double rating,
    required String bookImageAsset,
    required bool isTeal,
  }) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: isTeal ? const Color(0xFF5EE9EB) : const Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.only(top: 12),
            child: Image.asset(bookImageAsset, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            author,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
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
                          icon: const Icon(Icons.notifications_none, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Category
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF505A76),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.help_outline, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5E9EFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'This month',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _buildCategoryChip('Biology'),
                      _buildCategoryChip('Technology'),
                      _buildCategoryChip('Politics'),
                      _buildCategoryChip('Sains'),
                    ],
                  ),
                ),
              ),

              // Popular Books
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _navigateToBookDetail({
                            'title': 'Selena',
                            'author': 'Tere Liye',
                            'coverUrl': 'https://cdn.gramedia.com/uploads/items/Selena_cov.jpg',
                            'subtitle': 'Serial Bumi',
                            'rating': 4.4,
                            'goodreads': true,
                            'bookCount': 80,
                            'borrowerCount': 25,
                            'commentCount': 7,
                            'synopsis':
                                'The Bumi series has always been entertaining. It follows the adventure of Raib and her friends through various parallel worlds. This book focuses on a new character called Selena.',
                          });
                        },
                        child: _buildBookCard(
                          title: 'Selena - Tere Liye',
                          author: 'Tere Liye',
                          description: 'The Bumi series has always entertaining. Cool!',
                          rating: 4.4,
                          bookImageAsset: 'assets/images/1.png',
                          isTeal: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _navigateToBookDetail({
                            'title': 'Sapiens',
                            'author': 'Yuval Noah Harari',
                            'coverUrl': 'https://images-na.ssl-images-amazon.com/images/I/713jIoMO3UL.jpg',
                            'subtitle': 'Riwayat Singkat Umat Manusia',
                            'rating': 4.6,
                            'goodreads': true,
                            'bookCount': 85,
                            'borrowerCount': 27,
                            'commentCount': 5,
                            'synopsis':
                                'What does it mean to be human as we can see through history? Yuval Noah Harari takes us on a journey through the entire history of the human species, from its emergence to its dominance on Earth.',
                          });
                        },
                        child: _buildBookCard(
                          title: 'Sapiens - Yuval Noah',
                          author: 'Yuval Noah Harari',
                          description: 'What does it mean to be human as we can see',
                          rating: 4.6,
                          bookImageAsset: 'assets/images/2.png',
                          isTeal: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Recommendation
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Our Recommendation',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF505A76),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.help_outline, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5E9EFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'All genre',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _buildCategoryChip('Fiction'),
                      _buildCategoryChip('Romance'),
                      _buildCategoryChip('Old Classics'),
                      _buildCategoryChip('Self-help'),
                    ],
                  ),
                ),
              ),

              // Atomic Habits Card
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    _navigateToBookDetail({
                      'title': 'Atomic Habits',
                      'author': 'James Clear',
                      'coverUrl': 'https://images-na.ssl-images-amazon.com/images/I/91bYsX41DVL.jpg',
                      'subtitle': 'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
                      'rating': 4.8,
                      'goodreads': true,
                      'bookCount': 100,
                      'borrowerCount': 31,
                      'commentCount': 2,
                      'synopsis':
                          'Apapun tujuan Anda, Atomic Habits menawarkan kerangka kerja terbukti untuk meningkatkan diri setiap hari. James Clear, salah satu pakar terkemuka dunia di bidang pembentukan kebiasaan, mengungkapkan strategi praktis yang akan mengajarkan Anda cara membentuk kebiasaan baik, menghilangkan kebiasaan buruk, dan menguasai perubahan kecil...',
                    });
                  },
                  child: Container(
                    height: 160,
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
                          width: 120,
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/images/3.png', fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Atomic Habits',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'James Clear',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.star, size: 16, color: Colors.amber),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF5D8F),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'New',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
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
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
