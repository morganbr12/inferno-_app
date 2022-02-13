import 'package:flutter/material.dart';

class Items with ChangeNotifier {
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

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
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
