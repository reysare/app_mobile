import 'package:flutter/material.dart';
import '../models/history_models.dart';
import '../service/history_service.dart';
import '../service/auth_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<BorrowedBook> allBooks = [];
  List<BorrowedBook> filteredBooks = [];
  bool isLoading = true;
  String currentFilter = 'All';
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final books = await HistoryService().fetchHistory();
      setState(() {
        allBooks = books;
        _filterBooks(currentFilter);
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal memuat data histori: $e')));
    }
  }

  void _filterBooks(String filter) {
    setState(() {
      currentFilter = filter;
      if (filter == 'All') {
        filteredBooks = allBooks;
      } else {
        filteredBooks =
            allBooks
                .where(
                  (book) => book.status.toLowerCase() == filter.toLowerCase(),
                )
                .toList();
      }
    });
  }

  int _countByStatus(String status) {
    return allBooks
        .where((book) => book.status.toLowerCase() == status.toLowerCase())
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                onRefresh: fetchData,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatisticsSection(),
                      const SizedBox(height: 24),
                      _buildFilterTabs(),
                      const SizedBox(height: 16),
                      ...filteredBooks.map(_buildBookCard).toList(),
                    ],
                  ),
                ),
              ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return '${date.day}/${date.month}/${date.year}';
  }

  Widget _buildStatisticsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reading Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Books',
                  allBooks.length.toString(),
                  Icons.library_books,
                  Colors.white.withOpacity(0.2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Returned',
                  _countByStatus('returned').toString(),
                  Icons.check_circle,
                  Colors.green.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Borrowed',
                  _countByStatus('borrowed').toString(),
                  Icons.book,
                  Colors.orange.withOpacity(0.3),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Overdue',
                  _countByStatus('overdue').toString(),
                  Icons.warning,
                  Colors.red.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color bgColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final filters = ['All', 'Borrowed', 'Returned', 'Overdue'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          filters
              .map(
                (label) => GestureDetector(
                  onTap: () => _filterBooks(label),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          label == currentFilter
                              ? Colors.blue
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        color:
                            label == currentFilter
                                ? Colors.white
                                : Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildBookCard(BorrowedBook book) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              image:
                  book.coverImageUrl != null
                      ? DecorationImage(
                        image: NetworkImage(book.coverImageUrl!),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
            child:
                book.coverImageUrl == null
                    ? Center(
                      child: Icon(
                        Icons.book,
                        color: Colors.grey.shade600,
                        size: 30,
                      ),
                    )
                    : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  book.author,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                _buildStatusChip(book.status),
                const SizedBox(height: 8),
                Text(
                  'Borrowed: ${_formatDate(book.borrowDate)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
                Text(
                  'Due: ${_formatDate(book.returnDate)}',
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        book.status == 'overdue'
                            ? Colors.red
                            : Colors.grey.shade500,
                  ),
                ),
                if (book.denda != null && book.denda! > 0)
                  Text(
                    'Denda: Rp${book.denda}',
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          if (book.status == 'borrowed' || book.status == 'overdue')
            ElevatedButton(
              onPressed: () {
                // Tambahkan return logic jika diperlukan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              child: const Text(
                'Return',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'borrowed':
        color = Colors.orange;
        break;
      case 'returned':
        color = Colors.green;
        break;
      case 'overdue':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        status[0].toUpperCase() + status.substring(1),
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
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

        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/library');
        } else if (index == 2) {
          // Stay on this page
        } else if (index == 3) {
          Navigator.pushReplacementNamed(context, '/profil');
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Books'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}
