import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'Detail Buku',
                    style: TextStyle(
                      color: Color.fromARGB(255, 129, 129, 129),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 48,
                  ),
                ],
              ),
            ),

            // Book Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 20),
                    // const Text(
                    //   'NEW YORK TIMES BESTSELLER',
                    //   style: TextStyle(
                    //     fontSize: 11,
                    //     fontWeight: FontWeight.w600,
                    //     letterSpacing: 1.0,
                    //     color: Colors.black54,
                    //   ),
                    // ),
                    // const SizedBox(height: 16),
                    // const Text(
                    //   'PERUBAHAN KECIL YANG\nMEMBERIKAN HASIL LUAR BIASA',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 13,
                    //     fontWeight: FontWeight.bold,
                    //     letterSpacing: 0.5,
                    //     height: 1.3,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    const SizedBox(height: 24),
                    Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/3.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                'Gambar tidak ditemukan',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // const Text(
                    //   'Cara Mudah dan Terbukti\nuntuk Membentuk Kebiasaan Baik\ndan Menghilangkan Kebiasaan Buruk',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 13,
                    //     color: Colors.black87,
                    //     height: 1.4,
                    //   ),
                    // ),
                    const SizedBox(height: 24),
                    const Text(
                      'JAMES CLEAR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Atomic Habits',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 156, 182),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Blue Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(Icons.access_time, '100 Buku'),
                        _buildStatItem(Icons.menu_book, '31 peminjam'),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Synopsis
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sinopsis',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(105, 156, 223, 1),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Tambahkan ke\n Perpustakaan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(218, 66, 138, 187),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Pinjam',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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

  // 🔵 Komponen Statistik dengan Warna Biru
 Widget _buildStatItem(IconData icon, String text) {
  return Column(
    children: [
      Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: Color(0xFFE6EEF7), // Latar belakang biru muda
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Color(0xFF4699D0), size: 24), // Ikon biru
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF7A8CA3), // Warna teks keabu-biruan
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
}