import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> book = 
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? 
      {
        'title': 'Atomic Habits',
        'author': 'James Clear',
        'coverUrl': 'https://images-na.ssl-images-amazon.com/images/I/91bYsX41DVL.jpg',
        'subtitle': 'Perubahan Kecil Yang Memberikan Hasil Luar Biasa',
        'rating': 4.4,
        'goodreads': true,
        'bookCount': 100,
        'borrowerCount': 31,
        'commentCount': 2,
        'synopsis': 'Apapun tujuan Anda, Atomic Habits menawarkan kerangka kerja terbukti untuk meningkatkan diri setiap hari. James Clear, salah satu pakar terkemuka dunia di bidang pembentukan kebiasaan, mengungkapkan strategi praktis yang akan mengajarkan Anda cara membentuk kebiasaan baik, menghilangkan kebiasaan buruk, dan menguasai perubahan kecil...',
      };

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'ID',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                ],
              ),
            ),
            
            // Konten buku
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Teks bestseller New York Times
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'NEW YORK TIMES BESTSELLER',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      
                      // Indonesian title (subtitle from book data)
                      Text(
                        book['subtitle'] ?? 'PERUBAHAN KECIL YANG MEMBERIKAN HASIL LUAR BIASA',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Book cover and bookmark icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Book title and cover
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // English title in gold
                                Text(
                                  book['title'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD4AF37), // Gold color
                                  ),
                                ),
                                
                                const SizedBox(height: 16),
                                
                                // Author name and rating
                                Row(
                                  children: [
                                    Text(
                                      book['author'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    if (book['goodreads'] == true) ...[
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 8),
                                        width: 4,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const Text(
                                        'Goodreads',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      Text(
                                        '${book['rating'] ?? '4.4'}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          // Bookmark icon
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Statistik buku
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem(Icons.menu_book_outlined, '${book['bookCount'] ?? 100} Buku'),
                          _buildStatDivider(),
                          _buildStatItem(Icons.person_outline, '${book['borrowerCount'] ?? 31} peminjam'),
                          _buildStatDivider(),
                          _buildStatItem(Icons.chat_bubble_outline, '${book['commentCount'] ?? 2} komentar'),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Sinopsis
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sinopsis',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Baca selengkapnya',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Teks sinopsis
                      Text(
                        book['synopsis'] ?? 'Apapun tujuan Anda, Atomic Habits menawarkan kerangka kerja terbukti untuk meningkatkan diri setiap hari. James Clear, salah satu pakar terkemuka dunia di bidang pembentukan kebiasaan, mengungkapkan strategi praktis yang akan mengajarkan Anda cara membentuk kebiasaan baik, menghilangkan kebiasaan buruk, dan menguasai perubahan kecil...',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Book cover image
                      if (book['coverUrl'] != null)
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              book['coverUrl'],
                              height: 200,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 200,
                                  width: 140,
                                  color: Colors.grey.shade200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.book,
                                        size: 50,
                                        color: Colors.grey.shade400,
                                      ),
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
                      
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
            
            // Bottom buttons
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Tombol Tambahkan ke Perpustakaan
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ditambahkan ke perpustakaan'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Tambahkan ke\n Perpustakaan',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Tombol Pinjam
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Meminjam buku ${book['title']}'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Pinjam buku',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 22,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 24,
      width: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }
}