import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ordered_item.dart';
import '../Widget/orders.dart';
import '../Widget/back_arrow.dart';

class OrederedScreenPage extends StatelessWidget {
  const OrederedScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Ordered>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Your Orders"),
        centerTitle: true,
        leading: leadingIcon(context),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrdersDataCart(
          order: orderData.orders[i],
        ),
      ),
    );
  }
}
