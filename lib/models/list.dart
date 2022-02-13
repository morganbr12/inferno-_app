class Items {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  bool isFavorite;

  Items({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.isFavorite = false,
  });
}

class category {
  final String id;
  final String title;
  final String imageUrl;

  const category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}
