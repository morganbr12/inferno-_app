import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inferno/provider/ordered_item.dart';
import 'package:provider/provider.dart';

import '../Widget/cart.dart';
import '../provider/cart_provider.dart';
import '../Widget/back_arrow.dart';

class CartFill extends StatelessWidget {
  const CartFill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Text('Cart');
    final cart = Provider.of<Cart>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: title,
          centerTitle: true,
          leading: leadingIcon(context),
        ),
        body: cart.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No item in the Cart!",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // cart item arrangement
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cart.items.length,
                        itemBuilder: (ctx, i) => CartPage(
                          id: cart.items.values.toList()[i].id,
                          title: cart.items.values.toList()[i].title,
                          productId: cart.items.keys.toList()[i],
                          shortTitle: cart.items.values.toList()[i].shortTitle,
                          price: cart.items.values.toList()[i].price,
                          quantity: cart.items.values.toList()[i].quantity,
                          imageUrl: cart.items.values.toList()[i].imageUrl,
                        ),
                      ),
                    ),

                    //order and delivery fee
                    Divider(
                      thickness: 1.h,
                      color: Colors.white,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Order',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.7),
                                      fontSize: 20,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ghc ${cart.totalAmount}',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7),
                                    fontSize: 20,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Delivery Fee',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.7),
                                      fontSize: 20,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ghc 0.0',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7),
                                    fontSize: 20,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      thickness: 1.h,
                      color: Colors.white,
                      indent: 20,
                      endIndent: 20,
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Total',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            '\Ghc ${cart.totalAmount}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Icon Botton
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Provider.of<Ordered>(context, listen: false).addOrder(
                        //   cart.items.values.toList(),
                        //   cart.totalAmount,
                        // );
                        Navigator.of(context).pushNamed('/payments');
                        // cart.clearCart();
                      },
                      child: const Text(
                        'Proceed to Payment',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.2,
                            vertical: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
