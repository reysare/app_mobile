import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

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
}
