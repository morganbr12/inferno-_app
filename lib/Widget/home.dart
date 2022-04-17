import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/popular_food.dart';
// import '../Widget/products.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
// import '../Widget/choose_cati.dart';
import '../Widget/top_container.dart';
// import '../Widget/app_bar.dart' as app;

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  var _isInit = true;
  bool _isLoading = false;
  void toViewAllPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/viewall');
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      closeTopContainer = controller.offset > 50;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fectureAndSetProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final productDetails = Provider.of<Products>(context);
    final prod = productDetails.FOOD_ITEM;

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          )
        : SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: width,
                      alignment: Alignment.topLeft,
                      height: closeTopContainer ? 0 : height * 0.19,
                      child: const HomePageTopContainer()),
                  const SizedBox(
                    height: 7,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 8.0, left: 10),
                  //   child: Text(
                  //     'Categories',
                  //     style: Theme.of(context).textTheme.headline2,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 55.h,
                  //   width: double.maxFinite,
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     children: Categories.map((cat) => ChooseFoodItem(
                  //           cat.title,
                  //           cat.imageUrl,
                  //         )).toList(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
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
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: prod.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        value: prod[i],
                        child: const PopularFood(
                            // prod[i].id,
                            // prod[i].title,
                            // prod[i].imageUrl,
                            // prod[i].price,
                            // prod[i].description,
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
