import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




import '../models/details.dart';
import '../Widget/choose_cati.dart';
import '../Widget/top_container.dart';
import '../Widget/popular_food.dart';

class HomeBody extends StatelessWidget {
  const HomeBody( {Key? key}) : super(key: key);


 void toViewAllPage(BuildContext ctx) {
   Navigator.of(ctx).pushNamed('/viewall');
 }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            const HomePageTopContainer(),
            const SizedBox(
              height: 7,
            ),
             Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 10),
              child: Text(
                  'Categories',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 45.h,
              width: 110.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: Categories.map((cat) => ChooseFoodItem(
                   cat.title,
                  cat.imageUrl,
                )).toList(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 8.0),
                   child: Text(
                      'Popular Now',
                    style: Theme.of(context).textTheme.headline2
                ),
                 ),
                InkWell(
                  onTap: () => toViewAllPage(context),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          "View all",
                          style: TextStyle(
                            color: Color.fromRGBO(203, 160, 68, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color.fromRGBO(203, 160, 68, 1),)
                          ),
                            child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                              size: 13,
                              color: Color.fromRGBO(203, 160, 68, 1),
                            ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: FOOD_ITEM.map((cat) => PopularFood(
                          cat.title,
                        cat.imageUrl,
                    cat.price,
                    cat.description
                      )).toList(),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
