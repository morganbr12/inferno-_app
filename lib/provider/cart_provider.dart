import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String shortTitle;
  final String imageUrl;
  double price;
  double quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.price);
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    String imageUrl,
    String shortTitle,
  ) {
    if (_items.containsKey(productId)) {
      // update the exiting quantity
      // _items.update(
      //   productId,
      //   (existingCartItem) => CartItem(
      //     id: DateTime.now().toString(),
      //     title: title,
      //     shortTitle: shortTitle,
      //     imageUrl: imageUrl,
      //     price: price,
      //     quantity: existingCartItem.quantity + 1,
      //   ),
      // );
      return;
    } else {
      // adding new item into the cart
      _items.putIfAbsent(
        productId,
        () => CartItem(
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

  void decreaseQtyAndPric(
      String productId,
      double price,
      double quantity,
      String title,
      String imageUrl,
      String shortTitle,) {
    if (quantity > 1 ) {
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: DateTime.now().toString(),
          title: title,
          shortTitle: shortTitle,
          imageUrl: imageUrl,
          price: existingCartItem.price - price,
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else{
      return;
    }
    notifyListeners();
  }

  void increaseQtyAndPric(
      String productId,
      double price,
      String title,
      String imageUrl,
      String shortTitle,
      double quantity,
      ) {
    if (quantity >= 1) {
      //update the exiting quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: DateTime.now().toString(),
          title: title,
          shortTitle: shortTitle,
          imageUrl: imageUrl,
          price:  quantity * price,
          quantity: existingCartItem.quantity += 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
