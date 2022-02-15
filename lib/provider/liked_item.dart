import 'package:flutter/foundation.dart';

class LikedItem {
  final String id;
  final String title;
  final String shortTitle;
  final String imageUrl;
  final double price;
  final double quantity;

  LikedItem({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class Like with ChangeNotifier {
  final Map<String, LikedItem> _liked = {};

  Map<String, LikedItem> get liked {
    return {..._liked};
  }

  int get likedCount {
    return _liked.length;
  }

  // adding items to the liked page

  void addLikedItem(
    String productId,
    double price,
    String title,
    String imageUrl,
    String shortTitle,
  ) {
    if (_liked.containsKey(productId)) {
      // update the exiting quantity
      _liked.update(
        productId,
        (existingCartItem) => LikedItem(
          id: DateTime.now().toString(),
          title: title,
          shortTitle: shortTitle,
          imageUrl: imageUrl,
          price: price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // adding new item into the cart
      _liked.putIfAbsent(
        productId,
        () => LikedItem(
          id: DateTime.now().toString(),
          title: title,
          shortTitle: shortTitle,
          imageUrl: imageUrl,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }
}
