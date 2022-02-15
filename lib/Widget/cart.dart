import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  final String shortTitle;
  final double price;
  final String imageUrl;
  final double quantity;

  const CartPage(
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
  Widget build(BuildContext context) {
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
                  imageUrl,
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
                        title,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        shortTitle,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '\Ghc ${price * quantity}',
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
                    Provider.of<Cart>(context, listen: false)
                        .removeItem(productId);
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
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            Icons.minimize,
                            color: Theme.of(context).accentColor,
                            size: 18,
                          ),
                        ),
                      ),
                      Text('$quantity'),
                      IconButton(
                        onPressed: () {},
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
