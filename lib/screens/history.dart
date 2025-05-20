import 'package:flutter/material.dart';

class HistoryPengembalianPage extends StatelessWidget {
  HistoryPengembalianPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> riwayatPengembalian = [
    {
      'judul': 'Atomic Habits',
      'penulis': 'James Clear',
      'tanggalPinjam': DateTime(2025, 5, 1),
      'tanggalKembali': DateTime(2025, 5, 10),
      'kondisi': 'Baik',
      'catatan': 'Tidak ada kerusakan',
      'coverUrl':
          'https://m.media-amazon.com/images/I/51-nXsSRfZL._SY445_SX342_.jpg',
    },
    {
      'judul': 'Flutter for Beginners',
      'penulis': 'John Doe',
      'tanggalPinjam': DateTime(2025, 4, 20),
      'tanggalKembali': DateTime(2025, 4, 30),
      'kondisi': 'Rusak Ringan',
      'catatan': 'Halaman 45 robek sedikit',
      'coverUrl': 'https://dummyimage.com/60x90/cccccc/000000&text=Flutter',
    },
  ];

  String _formatTanggal(DateTime date) {
    const bulan = [
      'Januari','Februari','Maret','April','Mei','Juni',
      'Juli','Agustus','September','Oktober','November','Desember'
    ];
    return '${date.day} ${bulan[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pengembalian'),
        backgroundColor: const Color(0xFF5B95E4),
        centerTitle: true,
      ),
      body: riwayatPengembalian.isEmpty
          ? Center(
              child: Text(
                'Belum ada riwayat pengembalian buku.',
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: riwayatPengembalian.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = riwayatPengembalian[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item['coverUrl'],
                        width: 60,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 60,
                          height: 90,
                          color: Colors.grey[300],
                          child: const Icon(Icons.book, color: Colors.grey),
                        ),
                      ),
                    ),
                    title: Text(
                      item['judul'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Penulis: ${item['penulis']}'),
                          const SizedBox(height: 4),
                          Text('Dipinjam: ${_formatTanggal(item['tanggalPinjam'])}'),
                          Text('Dikembalikan: ${_formatTanggal(item['tanggalKembali'])}'),
                          const SizedBox(height: 4),
                          Text('Kondisi saat kembali: ${item['kondisi']}'),
                          if ((item['catatan'] as String).isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Catatan: ${item['catatan']}',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.history, color: Color(0xFF5B95E4)),
                  ),
                );
              },
            ),
    );
  }
}