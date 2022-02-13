import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inferno/models/list.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class PopularFood extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;
  // final String description;
  const PopularFood({Key? key}) : super(key: key);

  // void toViewFullPage(BuildContext context) {
  //    Navigator.of(context).pushNamed('/viewfood', arguments: products.id);
  // }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Items>(context, listen: false);
    return Container(
      height: 255.h,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        // height: 170,
        child: Column(
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.circular(20),
                ),
              ),
              child: InkWell(
                onTap: () => {
                  Navigator.of(context)
                      .pushNamed('/viewfood', arguments: products.id)
                },
                child: Stack(
                  children: [
                    Container(
                      height: 175.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(20),
                        ),
                        child: Image.asset(
                          products.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Consumer<Items>(
                        builder: (ctx, products, _) => InkWell(
                          onTap: () {
                            products.toggleFavoriteStatus();
                          },
                          child: Image.asset(
                            'assets/images/icons/flat-color-icons_like.png',
                            color:
                                products.isFavorite ? Colors.red : Colors.grey,
                            scale: 0.8,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 127.sp,
                      bottom: 0.sp,
                      child: Container(
                        height: 42.h,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            '30 - 34min',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(products.title,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      size: 20,
                      color: Theme.of(context).accentColor,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 17.0),
                  child: Text(
                    '4.8',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17.0),
                  child: Text(
                    products.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17.0, left: 20),
                  child: Text(
                    'Ghc ${products.price}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
