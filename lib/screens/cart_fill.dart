import 'package:flutter/material.dart';

import '../Widget/cart.dart';

class CartFill extends StatelessWidget {
  const CartFill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Text('Cart');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: title,
          centerTitle: true,

        ),

        body: Column(
          children: [
            const CartPage(),

          ],

        ),
      ),
    );
  }
}
