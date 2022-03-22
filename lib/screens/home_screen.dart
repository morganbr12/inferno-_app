import 'package:flutter/material.dart';
import 'package:inferno/screens/love.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../Widget/app_bar.dart';
import '../Widget/home.dart';
import '../screens/nofication.dart';
import 'track_order_screen.dart';
import '../models/notificationList.dart';
import '../Widget/badge.dart';
import '../provider/cart_provider.dart';
import '../screens/search_item_screen.dart';

class InfernoHomePage extends StatefulWidget {
  const InfernoHomePage({Key? key}) : super(key: key);

  @override
  State<InfernoHomePage> createState() => _InfernoHomePageState();
}

class _InfernoHomePageState extends State<InfernoHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _tapNavButton = [
    HomeBody(),
    LikedScreen(),
    SearchScreen(),
    NotificationArea(),
    CartScreen(),
  ];

  static List<NotificationList> get title => listNotification;

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

  void toCartScreen(BuildContext ctx) {
    Navigator.of(context).pushNamed('/cart_fill');
  }

  void toTrackingPage(ctx2) {
    Navigator.of(ctx2).pushNamed('/tracking');
  }

  @override
  Widget build(BuildContext context) {
    final title = Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Feather.map_pin,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              'Madina, Accra',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );

    final drawerConnect = Container(
      margin: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
      child: InkWell(
        onTap: () => toProfileScreen(context),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: title,
        centerTitle: true,
        leading: drawerConnect,
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () => toCartScreen(context),
              ),
              color: Theme.of(context).primaryColor,
              value: cart.itemCount.toString(),
            ),
          ),
        ],
      ),
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: _tapNavButton.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: const Icon(
            Feather.search,
            color: Colors.black,
          ),
          hoverElevation: 10,
          tooltip: 'search',
          backgroundColor: Colors.white,
        ),
      ),
      bottomNavigationBar: SizedBox(
          // height: 62.h,
          child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 0.01,
              clipBehavior: Clip.hardEdge,
              child: Container(
                  height: kBottomNavigationBarHeight,
                  child: Container(child: bottonNavBar(context))))),
    );
  }

  // Bottom Navigation Bar Funtion

  BottomNavigationBar bottonNavBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedFontSize: 12,
      currentIndex: _selectedIndex,
      onTap: _onTapItem,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(icon: Icon(Feather.home), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Feather.heart), label: 'like'),
        const BottomNavigationBarItem(
          tooltip: 'search',
          activeIcon: null,
          icon: Icon(null),
          label: 'null',
        ),
        const BottomNavigationBarItem(
            icon: Icon(Feather.bell), label: 'Notification'),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () => toTrackingPage(context),
            child: const Icon(Icons.directions_car),
          ),
          label: 'Cart',
        )
      ],
    );
  }
}
