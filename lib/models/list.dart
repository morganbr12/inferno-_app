import 'package:flutter/material.dart';

class Items with ChangeNotifier {
  final String id;
  final String title;
  final String shortTitle;
  final String imageUrl;
  final double price;
  final String description;
  double duration;
  int rate;

  bool isFavorite;

  Items({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.duration,
    this.rate = 0,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Category {
  final String id;
  final String title;
  final String imageUrl;

  const Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}
