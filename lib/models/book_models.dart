class Book {
  final String title;
  final String author;
  final String coverUrl;
  final bool isNew;
  final String? subtitle;
  final double rating;
  final bool goodreads;
  final int bookCount;
  final int borrowerCount;
  final int commentCount;
  final String synopsis;
  final String? discount;

  Book({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.isNew,
    this.subtitle,
    required this.rating,
    required this.goodreads,
    required this.bookCount,
    required this.borrowerCount,
    required this.commentCount,
    required this.synopsis,
    this.discount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      coverUrl: json['coverUrl'],
      isNew: json['isNew'] ?? false,
      subtitle: json['subtitle'],
      rating: (json['rating'] ?? 0).toDouble(),
      goodreads: json['goodreads'] ?? false,
      bookCount: json['bookCount'] ?? 0,
      borrowerCount: json['borrowerCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      synopsis: json['synopsis'] ?? '',
      discount: json['discount'],
    );
  }
}
