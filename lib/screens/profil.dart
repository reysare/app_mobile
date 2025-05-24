import 'package:flutter/material.dart';

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

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Set to 3 since this is the Account/Profile page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue[700]),
          onPressed: () {},
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
          _buildPreferencesSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
                  icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Munawwaroh',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.alternate_email, size: 16, color: Colors.blue[700]),
              const SizedBox(width: 4),
              Text(
                'munaw.00', // Diperbaiki: tanpa simbol @ lagi
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

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
          Navigator.pushReplacementNamed(context, '/account');
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