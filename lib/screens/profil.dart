import 'package:flutter/material.dart';

<<<<<<< HEAD
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perpustakaan App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
=======
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/library');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/history');
      } else if (index == 3) {
        // Already on profile page
      }
    }
  }
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue[700]),
<<<<<<< HEAD
          onPressed: () {},
=======
          onPressed: () => Navigator.pop(context),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.blue[800],
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildProfileHeader(),
          const SizedBox(height: 30),
          _buildCollectionSection(context),
          const SizedBox(height: 20),
<<<<<<< HEAD
          _buildPreferencesSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
=======
          _buildStatsSection(),
          const SizedBox(height: 20),
          _buildPreferencesSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                  image: const DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/150?img=32'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue,
                child: IconButton(
                  padding: EdgeInsets.zero,
<<<<<<< HEAD
                  icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
=======
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: Colors.white,
                  ),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Munawwaroh',
<<<<<<< HEAD
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
=======
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.alternate_email, size: 16, color: Colors.blue[700]),
              const SizedBox(width: 4),
              Text(
<<<<<<< HEAD
                'munaw.00', // Diperbaiki: tanpa simbol @ lagi
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
=======
                '@munaw.00',
                style: TextStyle(fontSize: 14, color: Colors.blue[700]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.stars, size: 16, color: Colors.amber[700]),
                const SizedBox(width: 4),
                Text(
                  'Premium Member',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
        ],
      ),
    );
  }

  Widget _buildCollectionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Koleksi saya',
<<<<<<< HEAD
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
=======
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              _buildBookCard(
                'Laskar Pelangi',
                'Andrea Hirata',
                'https://upload.wikimedia.org/wikipedia/id/8/8e/Laskar_pelangi_sampul.jpg',
              ),
              _buildBookCard(
                'Atomic Habits',
                'James Clear',
                'https://m.media-amazon.com/images/I/51-nXsSRfZL._SY445_SX342_.jpg',
              ),
              _buildBookCard(
                'Filosofi Teras',
                'Henry Manampiring',
                'https://cdn.gramedia.com/uploads/items/9786024246945_Filosofi-Teras.jpg',
              ),
              _buildBookCard(
                'Rich Dad Poor Dad',
                'Robert T. Kiyosaki',
                'https://m.media-amazon.com/images/I/51AHZGhzZEL.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(String title, String author, String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
<<<<<<< HEAD
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
=======
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
          ),
          const SizedBox(height: 2),
          Text(
            author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
<<<<<<< HEAD
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
=======
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
=======
  Widget _buildStatsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistik Bacaan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('12', 'Buku Dibaca', Icons.menu_book, Colors.blue),
              _buildStatItem(
                '5',
                'Sedang Dibaca',
                Icons.hourglass_top,
                Colors.orange,
              ),
              _buildStatItem('23', 'Wishlist', Icons.favorite, Colors.red),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.7,
              minHeight: 10,
              backgroundColor: Colors.grey[200],
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Target bacaan tahun ini: 70%',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
  Widget _buildPreferencesSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPreferenceItem('Pengaturan Akun', Icons.settings),
          _buildPreferenceItem('Notifikasi', Icons.notifications),
          _buildPreferenceItem('Riwayat Peminjaman', Icons.history),
          _buildPreferenceItem('Genre Favorit', Icons.category),
          _buildPreferenceItem('Bahasa Aplikasi', Icons.language),
          _buildPreferenceItem('Bantuan', Icons.help_outline),
        ],
      ),
    );
  }

  Widget _buildPreferenceItem(String title, IconData icon) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
<<<<<<< HEAD
        child: Icon(
          icon,
          color: Colors.blue[700],
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      onTap: () {},
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue[700],
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          activeIcon: Icon(Icons.book),
          label: 'Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined),
          activeIcon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }
=======
        child: Icon(icon, color: Colors.blue[700]),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
}
