class Pengembalian {
  final int id;
  final String namaPeminjam;
  final String judulBuku;
  final String tglKembali;
  final String denda;

  Pengembalian({
    required this.id,
    required this.namaPeminjam,
    required this.judulBuku,
    required this.tglKembali,
    required this.denda,
  });

  factory Pengembalian.fromJson(Map<String, dynamic> json) {
    return Pengembalian(
      id: json['id'],
      namaPeminjam: json['nama_peminjam'],
      judulBuku: json['judul_buku'],
      tglKembali: json['tgl_kembali'],
      denda: json['denda'],
    );
  }

  get tglPinjam => null;
}
