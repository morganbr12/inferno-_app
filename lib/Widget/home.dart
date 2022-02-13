import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/details.dart';
import '../Widget/choose_cati.dart';
import '../Widget/top_container.dart';
import '../Widget/popular_food.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  void toViewAllPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/viewall');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
              height: MediaQuery.of(context).size.height * 0.06,
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
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      elevation: 3,
                      child: Text('All',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  itemCount: FOOD_ITEM.length,
                  itemBuilder: (ctx, i) => PopularFood(
                    FOOD_ITEM[i].title,
                    FOOD_ITEM[i].imageUrl,
                    FOOD_ITEM[i].price,
                    FOOD_ITEM[i].description,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// children: FOOD_ITEM.map((cat) => PopularFood(
                  //         cat.title,
                  //       cat.imageUrl,
                  //   cat.price,
                  //   cat.description
                  //     )).toList(),
