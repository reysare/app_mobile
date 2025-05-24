import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/library.dart';
import 'screens/peminjaman.dart';
import 'screens/profil.dart';
import 'screens/pengembalian.dart';
import 'screens/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perpustakaan Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) =>  const BookstoreHomePage(),
        '/library': (context) => const LibraryPage (),
        '/peminjaman': (context) => const BookDetailScreen (),
<<<<<<< HEAD
        '/profil': (context) => const ProfilePage (), 
        '/pengembalian': (context) => const PengembalianPage (),
        '/history' :(context) => HistoryPage(),
=======
        '/history' :(context) => const HistoryPage(),
        '/profil': (context) => const ProfilePage (), 
        '/pengembalian': (context) => const PengembalianPage (),
        
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
      },
    );
  }
}
