import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
import '../provider/cart_provider.dart';
import 'back_arrow.dart';

class ViewFood extends StatelessWidget {
  const ViewFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodDetailsId = ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(foodDetailsId);
    final addToCart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: leadingIcon(context),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 140),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: Theme.of(context).backgroundColor),
          ),
          Positioned(
            top: 35.sp,
            left: 0.sp,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        loadedProduct.imageUrl.toString(),
                        fit: BoxFit.cover,
                        height: 299.h,
                        width: 324.w,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 44.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: IconButton(
                            splashColor: Theme.of(context).splashColor,
                            onPressed: () {},
                            icon: Icon(
                              Icons.minimize,
                              size: 15,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        Text(
                          '1',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        IconButton(
                          splashColor: Theme.of(context).splashColor,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loadedProduct.title,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              loadedProduct.shortTitle,
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            'Ghc ${loadedProduct.price}',
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.star,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '2,8',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/icons/emojione_fire.png',
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '150 kcal',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                  'assets/images/icons/flat-color-icons_alarm-clock.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '10-15 Min',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      loadedProduct.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ))),
                      onPressed: () {
                        addToCart.addItem(
                          loadedProduct.id,
                          loadedProduct.price,
                          loadedProduct.title,
                          loadedProduct.imageUrl,
                          loadedProduct.shortTitle,
                        );
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text(
                          'Add to Cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
