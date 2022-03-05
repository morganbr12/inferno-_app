import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/popular_food.dart';
import '../provider/product_provider.dart';

class FoodProducts extends StatelessWidget {
  const FoodProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetails = Provider.of<Products>(context);
    final prod = productDetails.FOOD_ITEM;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
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
    );
  }
}
