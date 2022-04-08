import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ordered_item.dart';
import '../Widget/newly_ordered.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ord = Provider.of<Ordered>(context);
    return SizedBox(
      child: ListView.builder(
        itemCount: ord.orders.length,
        itemBuilder: (_, i) => NewlyOrdered(
          order: ord.orders[i],
        ),
      ),
    );
  }
}
