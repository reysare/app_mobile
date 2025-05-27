class Book {
  final int id;
  final String isbn;
  final String judul;
  final String sinopsis;
  final String penulis;
  final String penerbit;
  final String tahunTerbit;
  final String kategori;
  final int stok;
  final String gambar;

  Book({
    required this.id,
    required this.isbn,
    required this.judul,
    required this.sinopsis,
    required this.penulis,
    required this.penerbit,
    required this.tahunTerbit,
    required this.kategori,
    required this.stok,
    required this.gambar,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: int.parse(json['id'].toString()),
      isbn: json['isbn'],
      judul: json['judul'],
      sinopsis: json['sinopsis'],
      penulis: json['penulis'],
      penerbit: json['penerbit'],
      tahunTerbit: json['tahun_terbit'],
      kategori: json['kategori'],
      stok: int.parse(json['stok'].toString()),
      gambar: json['gambar'],
    );
  }
  // URL gambar buku
  String? get coverUrl => gambar.isNotEmpty ? gambar : null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isbn': isbn,
      'judul': judul,
      'gambar': gambar,
      'sinopsis': sinopsis,
      'penulis': penulis,
      'penerbit': penerbit,
      'tahun_terbit': tahunTerbit,
      'kategori': kategori,
      'stok': stok,
    };
  }
}
