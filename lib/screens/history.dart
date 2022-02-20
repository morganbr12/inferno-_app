import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/history_page.dart';
import '../Widget/back_arrow.dart';
import '../provider/ordered_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Ordered>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: leadingIcon(context),
        centerTitle: true,
        title: Text(
          "Your Orders",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView.builder(
        itemCount: order.orders.length,
        itemBuilder: (ctx, i) => HistoryPage(
          order: order.orders[i],
        ),
      ),
    );
  }
}
