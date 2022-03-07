import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  final String id;
  final String title;
  final String productId;
  final String shortTitle;
  final double price;
  final String imageUrl;
  double quantity;

  CartPage(
      {required this.id,
      required this.title,
      required this.productId,
      required this.shortTitle,
      required this.price,
      required this.imageUrl,
      required this.quantity,
      Key? key})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // final qty = Provider.of<Cart>(context, listen: false);
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          children: [
            Container(
              height: 88.h,
              width: 88.w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).accentColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.shortTitle,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '\Ghc ${widget.price}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                    )
                  ],
                )),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Are you sure?"),
                        content: const Text('Do you want to remove the Item'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false)
                                  .removeItem(widget.productId);
                              Navigator.of(ctx).pop(true);
                            },
                            child: const Text("delete"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false)
                              .decreaseQtyAndPric(
                            widget.productId,
                            widget.price,
                            widget.quantity,
                            widget.title,
                            widget.imageUrl,
                            widget.shortTitle,
                          );
                        },
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            Icons.minimize,
                            color: Theme.of(context).accentColor,
                            size: 18,
                          ),
                        ),
                      ),
                      Text('${widget.quantity}'),
                      IconButton(
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false)
                              .increaseQtyAndPric(
                            widget.productId,
                            widget.price,
                            widget.title,
                            widget.imageUrl,
                            widget.shortTitle,
                            widget.quantity,
                          );
                          // setState(() {
                          //   widget.quantity += 1;
                          // });
                        },
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).accentColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
