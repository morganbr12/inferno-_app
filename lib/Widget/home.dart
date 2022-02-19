import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inferno/Widget/products.dart';

import '../provider/product_provider.dart';
import '../Widget/choose_cati.dart';
import '../Widget/top_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  void toViewAllPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/viewall');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: height,
            width: width,
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
                  height: 50.h,
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
                          child: Text(
                            'All',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FoodProducts(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
