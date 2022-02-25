import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:crypto_app_ui/pages/favorites.dart';
import 'package:crypto_app_ui/pages/home.dart';
import 'package:crypto_app_ui/pages/search.dart';
import 'package:crypto_app_ui/pages/settingsPage.dart';
import 'package:crypto_app_ui/pages/trendings.dart';
import 'package:flutter/material.dart';

class HomePageNavbar extends StatefulWidget {
  HomePageNavbar({Key? key}) : super(key: key);

  @override
  State<HomePageNavbar> createState() => _HomePageNavbarState();
}

class _HomePageNavbarState extends State<HomePageNavbar> {
  int pageIndex = 2;

  List pages = [
    Trending(),
    Search(),
    HomePage(),
    Favorites(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[pageIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: bottombar(),
            ),
          ),
        ],
      ),
    );
  }

  // bottom bar

  Widget bottombar() {
    return Container(
      child: CurvedNavigationBar(
        index: 2,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.trending_up, size: 30),
          Icon(Icons.star_outline, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.grey.shade700,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
