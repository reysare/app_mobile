class Profile {
  final String nama;
  final String nis;

  Profile({required this.nama, required this.nis});

  factory Profile.fromJson(Map<String, dynamic> json) {
    // Ambil dari key "data"
    final data = json['data'] ?? {};
    return Profile(
      nama: data['nama'] ?? 'Nama tidak ditemukan',
      nis: data['nis'] ?? 'NIS tidak ditemukan',
    );
  }
}
