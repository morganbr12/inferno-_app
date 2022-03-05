import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:inferno/Widget/badge.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

Widget appBar(BuildContext ctx) {
  final title = Container(
    margin: const EdgeInsets.all(6),
    padding: const EdgeInsets.only(right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Feather.map_pin,
          size: 20,
          color: Theme.of(ctx).primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            'Madina, Accra',
            style: Theme.of(ctx).appBarTheme.titleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Theme.of(ctx).primaryColor,
          ),
        )
      ],
    ),
  );
  return AppBar(
    title: title,
    centerTitle: true,
    leading: Container(
      margin: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
      child: InkWell(
        onTap: () => Navigator.of(ctx).pushNamedAndRemoveUntil('/profile', (route) => false,),
        child: CircleAvatar(
          backgroundColor: Theme.of(ctx).accentColor,
          child: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
      ),
    ),
    actions: [
      Consumer<Cart>(
        builder: (_, cart, ch) => Badge(
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => toCartScreen(ctx),
          ),
          color: Theme.of(ctx).primaryColor,
          value: cart.itemCount.toString(),
        ),
      ),
    ],
  );
}

toCartScreen(context) {
}