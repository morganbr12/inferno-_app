import 'package:flutter/material.dart';
import 'package:inferno/screens/love.dart';


import '../Widget/home.dart';
import '../screens/nofication.dart';
import '../screens/cart_screen.dart';

class InfernoHomePage extends StatefulWidget {
  const InfernoHomePage({Key? key}) : super(key: key);

  @override
  State<InfernoHomePage> createState() => _InfernoHomePageState();
}

class _InfernoHomePageState extends State<InfernoHomePage> {


  int _selectedIndex = 0;

  static const List<Widget> _tapNavButton =[
    HomeBody(),
    LikedScreen(),
    NotificationArea(),
    CartScreen(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Container title() {
  //   return Container(
  //     child: ,
  //   );
  // }

  void toProfileScreen(BuildContext ctx) {
    Navigator.of(context).pushNamed('/profile');
  }

  @override
  Widget build(BuildContext context) {

    final title = Container(
      margin: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          Text(
              'Madina, Accra',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          Icon(
              Icons.keyboard_arrow_down_sharp,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: title,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 10, bottom: 10, top: 5),

          child: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: IconButton(
              onPressed: () => toProfileScreen(context),
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),


         body: SafeArea(
          child: _tapNavButton.elementAt(_selectedIndex),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.search, color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin),
            label: 'love'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'
          )
        ],
      ),
    );
  }
}
