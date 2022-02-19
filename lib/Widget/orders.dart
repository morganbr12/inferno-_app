import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

import '../provider/ordered_item.dart' as ord;

class OrdersDataCart extends StatelessWidget {
  final ord.OrderedItem order;

  const OrdersDataCart({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              'Ghc ${order.amount}',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              DateFormat('dd mm yyyy').format(order.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.expand_more),
            ),
          ),
        ),
      ],
    );
  }
}
