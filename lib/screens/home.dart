import 'package:flutter/material.dart';

class BookstoreHomePage extends StatefulWidget {
  const BookstoreHomePage({Key? key}) : super(key: key);

  @override
  State<BookstoreHomePage> createState() => _BookstoreHomePageState();
}

class _BookstoreHomePageState extends State<BookstoreHomePage> {
  int _selectedIndex = 0;

  // Method to handle navigation when bottom navigation items are clicked
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Navigate to different pages based on the selected index
      if (index == 1) {
        // Navigate to Books/Library page
        Navigator.pushReplacementNamed(context, '/library');
      } else if (index == 2) {
        // Navigate to History page if you have one
        Navigator.pushReplacementNamed(context, '/history');
      } else if (index == 3) {
        // Navigate to Account page if you have one
        Navigator.pushReplacementNamed(context, '/profil');
      }
      // No navigation for index 0 (Home) since we're already there
    }
  }

  // Method to navigate to book detail screen
  void _navigateToBookDetail(Map<String, dynamic> book) {
    Navigator.pushNamed(
      context, 
      '/peminjaman', 
      arguments: book
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

              // Category Tabs
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
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

              const SizedBox(height: 20),

              // Book Cards
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
                            'coverUrl':
                                'https://cdn.gramedia.com/uploads/items/Selena_cov.jpg',
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
                          description:
                              'The Bumi series has always entertaining. Cool!',
                          rating: 4.4,
                          bookImageAsset:
                              'assets/images/1.png', // This would be an actual asset
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
                            'coverUrl':
                                'https://images-na.ssl-images-amazon.com/images/I/713jIoMO3UL.jpg',
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
                          description:
                              'What does it mean to be human as we can see',
                          rating: 4.6,
                          bookImageAsset:
                              'assets/images/2.png', // This would be an actual asset
                          isTeal: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Our Recommendation
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

              // Genre Tabs
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
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

              const SizedBox(height: 24),

              // Recommendation Card with Atomic Habits Book
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    _navigateToBookDetail({
                      'title': 'Atomic Habits',
                      'author': 'James Clear',
                      'coverUrl':
                          'https://images-na.ssl-images-amazon.com/images/I/91bYsX41DVL.jpg',
                      'subtitle':
                          'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
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
                        // Book cover image (left)
                        Container(
                          width: 120,
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/3.png', // This would be an actual asset
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Book details (center)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Atomic Habits',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'James Clear',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Cara Mudah dan Terbukti untuk Membentuk Kebiasaan Baik',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
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

                        // "New" badge (right)
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
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

      // Bottom Navigation Bar with updated onTap method
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        onTap: _onItemTapped, // Using the navigation method
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

  // Helper method to build category chips
  Widget _buildCategoryChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
    );
  }

  // Helper method to build book cards
  Widget _buildBookCard({
    required String title,
    required String author,
    required String description,
    required double rating,
    required String bookImageAsset,
    required bool isTeal,
  }) {
    return Container(
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
          // Book cover image - using Image.asset instead of a colored container with icon
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              bookImageAsset,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          Row(
            children: [
              // Goodreads badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      isTeal
                          ? const Color(0xFF28B5B5).withOpacity(0.2)
                          : const Color(0xFFFF9B73).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Goodreads',
                  style: TextStyle(
                    fontSize: 10,
                    color:
                        isTeal
                            ? const Color(0xFF28B5B5)
                            : const Color(0xFFFF9B73),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Rating
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
