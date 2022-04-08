import 'package:flutter/material.dart';
// import 'package:http/http.dart';

class SearchStrings {
  final String title;
  final Icon icon;

  SearchStrings({
    required this.title,
    required this.icon,
  });
}

class CurrentLocationFilter with ChangeNotifier {
  final List<SearchStrings> _searchStringsList = [
    SearchStrings(
      title: 'Current Location',
      icon: const Icon(Icons.map),
    ),
    SearchStrings(
      title: 'Home',
      icon: const Icon(Icons.home),
    ),
    //  SearchStrings(
    //   title: '',
    //   icon: const Icon(Icons.),
    // ),
  ];

  List<SearchStrings> get stringsList {
    return [..._searchStringsList];
  }

  Iterable<SearchStrings> findCurrentLocation(String title) {
    return _searchStringsList.where((cur) => cur.title == title);
  }
}
