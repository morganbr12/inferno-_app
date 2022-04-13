import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../helper/location_helper.dart';
// import 'package:provider/provider.dart';
// import 'package:inferno/models/search_choose.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          const InkWell(
            onTap: _getUserLocation,
            child: ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              title: Text('Current Location'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
            ),
          )
        ],
      ),
    );
  }
}

// class CurrentLo extends StatefulWidget {
//   final SearchStrings search;
//   const CurrentLo({
//     Key? key,
//     required this.search,
//   }) : super(key: key);

//   @override
//   State<CurrentLo> createState() => _CurrentLoState();
// }

// class _CurrentLoState extends State<CurrentLo> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       // leading: Text(widget.search.),
//       title: Text(widget.search.title),
//     );
//   }
// }

Future<void> _getUserLocation() async {
  final locData = await Location().getLocation();
  final staticLoationName = LocationHelper.generateLocationAddress(
    locData.latitude,
    locData.longitude,
  );
}
