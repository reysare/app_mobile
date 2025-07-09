class BorrowedBook {
  final String title;
  final String author;
  final DateTime borrowDate;
  final DateTime? returnDate;
  final String status;
  final int? denda;
  final String? coverImageUrl;

  BorrowedBook({
    required this.title,
    required this.author,
    required this.borrowDate,
    this.returnDate,
    required this.status,
    this.denda,
    this.coverImageUrl,
  });

  factory BorrowedBook.fromJson(Map<String, dynamic> json) {
    return BorrowedBook(
      title: json['judul'] ?? json['judul_buku'] ?? 'No Title',
      author: json['penulis'] ?? 'Unknown Author',
      borrowDate: DateTime.parse(json['tgl_pinjam']),
      returnDate:
          json['tgl_kembali'] != null && json['tgl_kembali'] != ''
              ? DateTime.tryParse(json['tgl_kembali'])
              : null,
      status: json['status'] ?? 'borrowed',
      denda:
          json['denda'] != null && json['denda'] != ''
              ? int.tryParse(json['denda'].toString())
              : 0,
      coverImageUrl:
          json['gambar'] != null
              ? 'https://yourdomain.com/storage/${json['gambar']}'
              : null,
    );
  }
}
