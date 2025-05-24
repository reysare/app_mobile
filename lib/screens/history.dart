import 'package:flutter/material.dart';

<<<<<<< HEAD
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<BorrowedBook> borrowedBooks = [
    BorrowedBook(
      title: "Atomic Habits",
      author: "James Clear",
      borrowDate: DateTime(2024, 5, 1),
      returnDate: DateTime(2024, 5, 15),
      status: BookStatus.returned,
      coverColor: Colors.orange.shade100,
      coverImageUrl: 'https://covers.openlibrary.org/b/id/9259256-L.jpg',
    ),
    BorrowedBook(
      title: "Sapiens",
      author: "Yuval Noah Harari",
      borrowDate: DateTime(2024, 5, 10),
      returnDate: DateTime(2024, 5, 24),
      status: BookStatus.borrowed,
      coverColor: Colors.red.shade100,
      coverImageUrl: 'https://covers.openlibrary.org/b/id/10512627-L.jpg',
    ),
    BorrowedBook(
      title: "Si Putih",
      author: "Tere Liye",
      borrowDate: DateTime(2024, 5, 8),
      returnDate: DateTime(2024, 5, 22),
      status: BookStatus.borrowed,
      coverColor: Colors.grey.shade200,
      coverImageUrl: null,
    ),
    BorrowedBook(
      title: "Bunking",
      author: "Raditya Dika",
      borrowDate: DateTime(2024, 4, 20),
      returnDate: DateTime(2024, 5, 4),
      status: BookStatus.overdue,
      coverColor: Colors.purple.shade200,
      coverImageUrl: null,
    ),
  ];
=======
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
    Navigator.pop(context, true);
  }
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatisticsSection(),
            SizedBox(height: 24),
            _buildFilterTabs(),
            SizedBox(height: 16),
            _buildBooksList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Books'),
=======
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

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 2; // History is index 2 in navigation

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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        // Already on history page
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/profil');
      }
    }
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
<<<<<<< HEAD

  Widget _buildStatisticsSection() {
    int totalBorrowed = borrowedBooks.length;
    int returned = borrowedBooks.where((book) => book.status == BookStatus.returned).length;
    int borrowed = borrowedBooks.where((book) => book.status == BookStatus.borrowed).length;
    int overdue = borrowedBooks.where((book) => book.status == BookStatus.overdue).length;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reading Statistics', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildStatCard('Total Books', totalBorrowed.toString(), Icons.library_books, Colors.white.withOpacity(0.2))),
              SizedBox(width: 12),
              Expanded(child: _buildStatCard('Returned', returned.toString(), Icons.check_circle, Colors.green.withOpacity(0.3))),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildStatCard('Borrowed', borrowed.toString(), Icons.book, Colors.orange.withOpacity(0.3))),
              SizedBox(width: 12),
              Expanded(child: _buildStatCard('Overdue', overdue.toString(), Icons.warning, Colors.red.withOpacity(0.3))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color bgColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 8),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Row(
      children: [
        _buildFilterChip('All', true),
        SizedBox(width: 8),
        _buildFilterChip('Borrowed', false),
        SizedBox(width: 8),
        _buildFilterChip('Returned', false),
        SizedBox(width: 8),
        _buildFilterChip('Overdue', false),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade600,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBooksList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: borrowedBooks.length,
      itemBuilder: (context, index) {
        return _buildBookCard(borrowedBooks[index]);
      },
    );
  }

  Widget _buildBookCard(BorrowedBook book) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Book Cover
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              color: book.coverColor,
              borderRadius: BorderRadius.circular(8),
              image: book.coverImageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(book.coverImageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: book.coverImageUrl == null
                ? Center(
                    child: Icon(
                      Icons.book,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                  )
                : null,
          ),
          SizedBox(width: 16),

          // Book Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                SizedBox(height: 4),
                Text(book.author, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                SizedBox(height: 8),
                _buildStatusChip(book.status),
                SizedBox(height: 8),
                Text('Borrowed: ${_formatDate(book.borrowDate)}', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                Text(
                  'Due: ${_formatDate(book.returnDate)}',
                  style: TextStyle(fontSize: 12, color: book.status == BookStatus.overdue ? Colors.red : Colors.grey.shade500),
                ),
              ],
            ),
          ),

          // Return Button
          if (book.status == BookStatus.borrowed || book.status == BookStatus.overdue)
            ElevatedButton(
              onPressed: () => _returnBook(book),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text('Return', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BookStatus status) {
    Color color;
    String text;

    switch (status) {
      case BookStatus.borrowed:
        color = Colors.orange;
        text = 'Borrowed';
        break;
      case BookStatus.returned:
        color = Colors.green;
        text = 'Returned';
        break;
      case BookStatus.overdue:
        color = Colors.red;
        text = 'Overdue';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _returnBook(BorrowedBook book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Return Book'),
          content: Text('Are you sure you want to return "${book.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  book.status = BookStatus.returned;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${book.title} has been returned successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text('Return'),
            ),
          ],
        );
      },
    );
  }
}

class BorrowedBook {
  final String title;
  final String author;
  final DateTime borrowDate;
  final DateTime returnDate;
  BookStatus status;
  final Color coverColor;
  final String? coverImageUrl;

  BorrowedBook({
    required this.title,
    required this.author,
    required this.borrowDate,
    required this.returnDate,
    required this.status,
    required this.coverColor,
    this.coverImageUrl,
  });
}

enum BookStatus {
  borrowed,
  returned,
  overdue,
=======
>>>>>>> 3d6affe84ec656312610adbc09881998ac90d0ff
}
