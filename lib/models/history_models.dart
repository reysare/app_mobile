class BorrowedBook {
  final String title;
  final String author;
  final DateTime borrowDate;
  final DateTime returnDate;
  final String status;
  final int? denda;
  final String? coverImageUrl;

  BorrowedBook({
    required this.title,
    required this.author,
    required this.borrowDate,
    required this.returnDate,
    required this.status,
    this.denda,
    this.coverImageUrl,
  });

  factory BorrowedBook.fromJson(Map<String, dynamic> json) {
    return BorrowedBook(
      title: json['judul'] ?? 'No Title',
      author: json['penulis'] ?? 'Unknown Author',
      borrowDate: DateTime.parse(json['tgl_pinjam']),
      returnDate: DateTime.parse(json['tgl_kembali']),
      status: json['status'] ?? 'borrowed',
      denda:
          json['denda'] != null ? int.tryParse(json['denda'].toString()) : null,
      coverImageUrl:
          json['gambar'] != null
              ? 'https://yourdomain.com/storage/${json['gambar']}' // atau URL sesuai backend kamu
              : null,
    );
  }
}
