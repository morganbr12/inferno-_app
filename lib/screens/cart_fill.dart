import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Widget/cart.dart';
import '../provider/cart_provider.dart';

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
        ),
        body: SingleChildScrollView(
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
                            '\Ghc ${cart.totalAmount}',
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
                onPressed: () {},
                child: const Text(
                  'Proceed To Payment',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                      horizontal: 80,
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
