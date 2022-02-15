import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inferno/models/list.dart';
import 'package:provider/provider.dart';

import '../provider/liked_item.dart';
import '../provider/product_provider.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  final bool content = true;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 25.0,
      ),
      child: ListOfLikedItems(),
    );
  }
}

// the display of the list of items

class ListOfLikedItems extends StatelessWidget {
  const ListOfLikedItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final likedFoodId =ModalRoute.of(context)?.settings.arguments as String;

    final liked = Provider.of<Like>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: liked.liked.length,
            itemBuilder: (ctx, i) => LikedContent(
              id: liked.liked.values.toList()[i].id,
              title: liked.liked.values.toList()[i].title,
              productId: liked.liked.keys.toList()[i],
              shortTitle: liked.liked.values.toList()[i].shortTitle,
              price: liked.liked.values.toList()[i].price,
              imageUrl: liked.liked.values.toList()[i].imageUrl,
            ),
          ),
        ),
      ],
    );
  }
}

class LikedContent extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  final String shortTitle;
  final double price;
  final String imageUrl;

  const LikedContent({
    required this.id,
    required this.title,
    required this.productId,
    required this.shortTitle,
    required this.price,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 144.h,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 36, top: 5),
                child: Container(
                  height: 130.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(227, 230, 236, 1),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(left: 18, right: 10),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 110.0, top: 5),
                        child: Text(
                          shortTitle,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Color.fromRGBO(219, 29, 29, 1),
                            ),
                            const Text(
                              '4.8',
                              style: TextStyle(
                                  color: Color.fromRGBO(219, 29, 29, 1),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Text(
                              '(115+Rating)',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {},
                              splashColor: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                height: 30,
                                width: 75.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    elevation: 2,
                                    shadowColor: Colors.grey,
                                    color: const Color.fromRGBO(219, 29, 29, 1),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        'Buy Now',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 197.r,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150.r)),
                  child: Container(
                    height: 133.h,
                    width: 133.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
