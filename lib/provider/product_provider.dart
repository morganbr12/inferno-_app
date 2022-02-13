import 'package:flutter/material.dart';

import '../models/list.dart';

class Products with ChangeNotifier {
  List<Items> FOOD_ITEM = [
    Items(
      id: 'a',
      title: 'Pizza',
      imageUrl: 'assets/images/foodImages/pizza.png',
      price: 22,
      description: ' ultimate in burgers. 4 beef patties, '
          'sandwiched between two fresh mega buns, surrounded '
          'by an army of veg and encapsulated in 5 cheese slices. '
          'This is accompanied by a platoon of fries '
          '[yam, potato, cassava, or cocoyam]',
    ),
    Items(
      id: 'b',
      title: 'Burger',
      imageUrl: 'assets/images/foodImages/burger.png',
      price: 50,
      description: 'The ultimate in burgers. 4 beef patties, '
          'sandwiched between two fresh mega buns, surrounded '
          'by an army of veg and encapsulated in 5 cheese slices. '
          'This is accompanied by a platoon of fries '
          '[yam, potato, cassava, or cocoyam].',
    ),
    Items(
      id: 'c',
      title: 'Burger',
      imageUrl: 'assets/images/foodImages/kakratua.png',
      price: 22,
      description: ' ultimate in burgers. 4 beef patties, '
          'sandwiched between two fresh mega buns, surrounded '
          'by an army of veg and encapsulated in 5 cheese slices. '
          'This is accompanied by a platoon of fries '
          '[yam, potato, cassava, or cocoyam]',
    ),
    Items(
      id: 'd',
      title: 'Burger',
      imageUrl: 'assets/images/foodImages/kakratua.png',
      price: 50,
      description: ' ultimate in burgers. 4 beef patties, '
          'sandwiched between two fresh mega buns, surrounded '
          'by an army of veg and encapsulated in 5 cheese slices. '
          'This is accompanied by a platoon of fries '
          '[yam, potato, cassava, or cocoyam]',
    ),
    Items(
      id: 'e',
      title: 'Burger',
      imageUrl: 'assets/images/foodImages/kakratua.png',
      price: 70,
      description: ' ultimate in burgers. 4 beef patties, '
          'sandwiched between two fresh mega buns, surrounded '
          'by an army of veg and encapsulated in 5 cheese slices. '
          'This is accompanied by a platoon of fries '
          '[yam, potato, cassava, or cocoyam]',
    )
  ];

  List<Items> get _FOOD_ITEM {
    return [...FOOD_ITEM];
  }

  Items findById(String id) {
    return FOOD_ITEM.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // FOOD_ITEM.add(value);
    notifyListeners();
  }
}

const Categories = [
  category(
    id: 't1',
    title: 'Appetizers',
    imageUrl: 'assets/images/categories_icon/appetizer.jpeg',
  ),
  category(
    id: 't1',
    title: 'Salad',
    imageUrl: 'assets/images/categories_icon/saladi.png',
  ),
  category(
    id: 't1',
    title: 'Desserts',
    imageUrl: 'assets/images/categories_icon/dessert.png',
  ),
  category(
    id: 't1',
    title: 'Char Grilled',
    imageUrl: 'assets/images/categories_icon/char_grilled.png',
  ),
  category(
    id: 't1',
    title: 'Burgers',
    imageUrl: 'assets/images/categories_icon/burger.png',
  ),
  category(
    id: 't1',
    title: 'Pizza',
    imageUrl: 'assets/images/categories_icon/pizza.png',
  ),
  category(
    id: 't1',
    title: 'Sides',
    imageUrl: 'assets/images/categories_icon/side.png',
  ),
  category(
    id: 't1',
    title: 'Natural Juice',
    imageUrl: 'assets/images/categories_icon/juice.png',
  ),
  category(
    id: 't1',
    title: 'Cocktails Soft Drinks',
    imageUrl: 'assets/images/categories_icon/cocktail.png',
  ),
];
