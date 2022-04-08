import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:inferno/provider/ordered_item.dart';
import 'package:provider/provider.dart';

import '../Widget/cart.dart';
import '../Widget/cart_first_tab.dart';
import '../Widget/cart_second.dart';
import '../provider/cart_provider.dart';
import '../Widget/back_arrow.dart';

class CartFill extends StatefulWidget {
  const CartFill({Key? key}) : super(key: key);

  @override
  State<CartFill> createState() => _CartFillState();
}

class _CartFillState extends State<CartFill>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            leading: leadingIcon(context),
            bottom: TabBar(
              padding: const EdgeInsets.only(right: 5, left: 5),
              dragStartBehavior: DragStartBehavior.start,
              controller: _controller,
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).accentColor,
              tabs: const [
                Tab(
                  text: 'Cart',
                ),
                Tab(
                  text: 'Order',
                ),
              ],
            ),
          ),
          extendBodyBehindAppBar: true,
          body: TabBarView(
            controller: _controller,
            children: const [
              BuyNewFoodCart(),
              OrdersItem(),
            ],
          ),
        ),
      ),
    );
  }
}
