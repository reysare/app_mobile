class Peminjaman {
  final int? id;
  final String namaPeminjam;
  final String judulBuku;
  final String tglPinjam;
  final String tglKembali;
  final String?
  status; // optional kalau kamu pakai status 'process', 'borrowed', etc

  Peminjaman({
    this.id,
    required this.namaPeminjam,
    required this.judulBuku,
    required this.tglPinjam,
    required this.tglKembali,
    this.status,
  });

  factory Peminjaman.fromJson(Map<String, dynamic> json) {
    return Peminjaman(
      id: json['id'],
      namaPeminjam: json['nama_peminjam'],
      judulBuku: json['judul_buku'],
      tglPinjam: json['tgl_pinjam'],
      tglKembali: json['tgl_kembali'],
      status: json['status'] ?? 'process',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_peminjam': namaPeminjam,
      'judul_buku': judulBuku,
      'tgl_pinjam': tglPinjam,
      'tgl_kembali': tglKembali,
      if (status != null) 'status': status,
    };
  }
}
