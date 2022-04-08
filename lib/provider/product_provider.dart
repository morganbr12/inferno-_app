import 'dart:convert';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:path/path.dart';

import '../models/list.dart';

class Products with ChangeNotifier {
  // ignore: non_constant_identifier_names
  List<Items> FOOD_ITEM = [
    Items(
      id: 'a',
      title: 'Pizza',
      shortTitle: 'Cheezy Mozarella',
      imageUrl: 'assets/images/foodImages/pizza.png',
      price: 22,
      duration: 30 - 45,
      rate: 0,
      description: ' ultimate in burgers. 4 beef patties, '
          'sandwiched between two fresh mega buns, surrounded '
          'by an army of veg and encapsulated in 5 cheese slices. '
          'This is accompanied by a platoon of fries '
          '[yam, potato, cassava, or cocoyam]',
    ),
    // Items(
    //   id: 'b',
    //   title: 'Burger',
    //   shortTitle: 'Cheezy Mozarella',
    //   imageUrl: 'assets/images/foodImages/burger.png',
    //   price: 50,
    //   duration: 30 - 45,
    //   rate: 0,
    //   description: 'The ultimate in burgers. 4 beef patties, '
    //       'sandwiched between two fresh mega buns, surrounded '
    //       'by an army of veg and encapsulated in 5 cheese slices. '
    //       'This is accompanied by a platoon of fries '
    //       '[yam, potato, cassava, or cocoyam].',
    // ),
    // Items(
    //   id: 'c',
    //   title: 'Burger',
    //   shortTitle: 'Cheezy Mozarella',
    //   imageUrl: 'assets/images/foodImages/kakratua.png',
    //   price: 22,
    //   duration: 30 - 45,
    //   rate: 0,
    //   description: ' ultimate in burgers. 4 beef patties, '
    //       'sandwiched between two fresh mega buns, surrounded '
    //       'by an army of veg and encapsulated in 5 cheese slices. '
    //       'This is accompanied by a platoon of fries '
    //       '[yam, potato, cassava, or cocoyam]',
    // ),
    // Items(
    //   id: 'd',
    //   title: 'Burger',
    //   shortTitle: 'Cheezy Mozarella',
    //   imageUrl: 'assets/images/foodImages/kakratua.png',
    //   price: 50,
    //   duration: 30 - 45,
    //   rate: 0,
    //   description: ' ultimate in burgers. 4 beef patties, '
    //       'sandwiched between two fresh mega buns, surrounded '
    //       'by an army of veg and encapsulated in 5 cheese slices. '
    //       'This is accompanied by a platoon of fries '
    //       '[yam, potato, cassava, or cocoyam]',
    // ),
    // Items(
    //   id: 'e',
    //   title: 'Burger',
    //   shortTitle: 'Cheezy Mozarella',
    //   imageUrl: 'assets/images/foodImages/kakratua.png',
    //   price: 70,
    //   duration: 30 - 45,
    //   rate: 0,
    //   description: ' ultimate in burgers. 4 beef patties, '
    //       'sandwiched between two fresh mega buns, surrounded '
    //       'by an army of veg and encapsulated in 5 cheese slices. '
    //       'This is accompanied by a platoon of fries '
    //       '[yam, potato, cassava, or cocoyam]',
    // )
  ];

  List<Items> get _FOOD_ITEM {
    return [...FOOD_ITEM];
  }

  Items findById(String id) {
    return FOOD_ITEM.firstWhere((prod) => prod.id == id);
  }

  Future<void> fectureAndSetProduct() async {
    const url = "https://inferno-app-dbdb0.firebaseio.com/foodProducts.json";
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Items> loadedFoodProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedFoodProducts.add(
          Items(
            id: prodId,
            title: prodData['title'],
            shortTitle: prodData['shortTitle'],
            imageUrl: prodData['imageUrl'],
            price: prodData['price'],
            description: prodData['description'],
            duration: prodData['duration'],
            rate: prodData['rate'],
          ),
        );
      });
      FOOD_ITEM = loadedFoodProducts;
      notifyListeners();
    } catch (error) {
      error.toString();
    }
  }

  void addProduct() {
    // FOOD_ITEM.add(value);
    notifyListeners();
  }
}

// categories row on the first page

const Categories = [
  Category(
    id: 't1',
    title: 'Appetizers',
    imageUrl: 'assets/images/categories_icon/appetizer.jpeg',
  ),
  Category(
    id: 't2',
    title: 'Salad',
    imageUrl: 'assets/images/categories_icon/saladi.png',
  ),
  Category(
    id: 't3',
    title: 'Desserts',
    imageUrl: 'assets/images/categories_icon/dessert.png',
  ),
  Category(
    id: 't4',
    title: 'Char Grilled',
    imageUrl: 'assets/images/categories_icon/char_grilled.png',
  ),
  Category(
    id: 't5',
    title: 'Burgers',
    imageUrl: 'assets/images/categories_icon/burger.png',
  ),
  Category(
    id: 't6',
    title: 'Pizza',
    imageUrl: 'assets/images/categories_icon/pizza.png',
  ),
  Category(
    id: 't7',
    title: 'Sides',
    imageUrl: 'assets/images/categories_icon/side.png',
  ),
  Category(
    id: 't8',
    title: 'Natural Juice',
    imageUrl: 'assets/images/categories_icon/juice.png',
  ),
  Category(
    id: 't9',
    title: 'Cocktails Soft Drinks',
    imageUrl: 'assets/images/categories_icon/cocktail.png',
  ),
];
