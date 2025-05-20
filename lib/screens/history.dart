import 'package:flutter/material.dart';

// Model buku
class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final String borrowDate;
  final String dueDate;
  final bool isReturned;
  final double? rating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.borrowDate,
    required this.dueDate,
    required this.isReturned,
    this.rating,
  });
}

// Halaman pengembalian buku
class BookReturnPage extends StatefulWidget {
  final Book book;

  const BookReturnPage({Key? key, required this.book}) : super(key: key);

  @override
  _BookReturnPageState createState() => _BookReturnPageState();
}

class _BookReturnPageState extends State<BookReturnPage> {
  String? _selectedCondition;
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _submitReturn() {
    if (_selectedCondition == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih kondisi buku')),
      );
      return;
    }
    // Bisa tambah logic submit di sini
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pengembalian Buku',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Info buku
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      color: Colors.blueGrey[100],
                      child: const Center(
                        child: Icon(
                          Icons.book,
                          size: 80,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.book.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.book.author,
                      style: TextStyle(fontSize: 14, color: Colors.amber[800]),
                    ),
                    if (widget.book.rating != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Goodreads',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${widget.book.rating}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Informasi pinjam
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Peminjaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tanggal Pinjam',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          widget.book.borrowDate,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Batas Waktu',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          widget.book.dueDate,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Pilih kondisi buku
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kondisi Buku',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text('Pilih kondisi buku'),
                          ),
                          value: _selectedCondition,
                          items:
                              ['Baik', 'Rusak Ringan', 'Rusak Berat']
                                  .map(
                                    (cond) => DropdownMenuItem(
                                      value: cond,
                                      child: Text(cond),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCondition = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _notesController,
                      decoration: InputDecoration(
                        hintText: 'Catatan tambahan (opsional)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tombol kembalikan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedCondition == null ? null : _submitReturn,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Kembalikan Buku',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman riwayat peminjaman
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Data buku contoh
  final List<Book> _borrowedBooks = [
    Book(
      id: '1',
      title: 'Atomic Habits',
      author: 'James Clear',
      imageUrl: '',
      borrowDate: '15 Mei 2025',
      dueDate: '22 Mei 2025',
      isReturned: false,
      rating: 4.4,
    ),
    Book(
      id: '2',
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      imageUrl: '',
      borrowDate: '10 Mei 2025',
      dueDate: '17 Mei 2025',
      isReturned: false,
      rating: 4.6,
    ),
  ];

  final List<Book> _returnedBooks = [
    Book(
      id: '3',
      title: 'Rich Dad Poor Dad',
      author: 'Robert T. Kiyosaki',
      imageUrl: '',
      borrowDate: '1 Mei 2025',
      dueDate: '8 Mei 2025',
      isReturned: true,
      rating: 4.7,
    ),
    Book(
      id: '4',
      title: 'Thinking, Fast and Slow',
      author: 'Daniel Kahneman',
      imageUrl: '',
      borrowDate: '25 April 2025',
      dueDate: '2 Mei 2025',
      isReturned: true,
      rating: 4.5,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _handleReturnBook(Book book) {
    setState(() {
      _borrowedBooks.removeWhere((b) => b.id == book.id);
      _returnedBooks.add(
        Book(
          id: book.id,
          title: book.title,
          author: book.author,
          imageUrl: book.imageUrl,
          borrowDate: book.borrowDate,
          dueDate: book.dueDate,
          isReturned: true,
          rating: book.rating,
        ),
      );
    });
  }

  Widget _buildBooksList(List<Book> books, bool isReturned) {
    if (books.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isReturned ? Icons.assignment_turned_in : Icons.book,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              isReturned
                  ? 'Belum ada buku yang dikembalikan'
                  : 'Belum ada buku yang dipinjam',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
          child: ListTile(
            leading: Container(
              width: 50,
              height: 70,
              color: Colors.blueGrey[100],
              child: const Icon(Icons.book, color: Colors.blueGrey),
            ),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing:
                isReturned
                    ? null
                    : ElevatedButton(
                      child: const Text('Kembalikan'),
                      onPressed: () async {
                        final result = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookReturnPage(book: book),
                          ),
                        );
                        if (result == true) {
                          _handleReturnBook(book);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${book.title} berhasil dikembalikan',
                              ),
                            ),
                          );
                        }
                      },
                    ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Peminjaman'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Buku Dipinjam'),
            Tab(text: 'Buku Dikembalikan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBooksList(_borrowedBooks, false),
          _buildBooksList(_returnedBooks, true),
        ],
      ),
    );
  }
}

