import 'package:flutter/foundation.dart';

import '../provider/cart_provider.dart';

class OrderedItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderedItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Ordered with ChangeNotifier {
  final List<OrderedItem> _orders = [];

  List<OrderedItem> get orders {
    return [..._orders];
  }

  void addOrder(
    List<CartItem> cartProducts,
    double total,
  ) {
    _orders.insert(
      0,
      OrderedItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
