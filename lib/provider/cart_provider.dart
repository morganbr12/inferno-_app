import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String shortTitle;
  final double price;
  final double quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
    String productId,
    double price,
    String title,
    String shortTitle,
  ) {
    if (_items.containsKey(productId)) {
      // update the exiting quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: DateTime.now().toString(),
          title: title,
          shortTitle: shortTitle,
          price: price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // adding new item into the cart
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          shortTitle: shortTitle,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
}
