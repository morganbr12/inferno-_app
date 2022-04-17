import 'package:flutter/material.dart';

class SearchForFood extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: const Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final currentLoc = Provider.of<CurrentLocationFilter>(context);
    // TODO: implement buildSuggestions
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Chicken Pizza'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Kakratua Pizza'),
            ),
          )
        ],
      ),
    );
  }
}
