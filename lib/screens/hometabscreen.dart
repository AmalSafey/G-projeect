import 'package:flutter/material.dart';

import 'package:flutter_application_graduation/screens/cart.dart';
import 'package:flutter_application_graduation/screens/detailsfirstbageforcustomer.dart';

import 'package:flutter_application_graduation/screens/favourit.dart';
import 'package:flutter_application_graduation/screens/search.dart';

class hometabscreen extends StatefulWidget {
  static String routname = "hometabscreen";

  @override
  State<hometabscreen> createState() => _hometabscreenState();
}

class _hometabscreenState extends State<hometabscreen> {
  final List<Widget> pages = [
    detailsfirstscreencustomer(),
    favourit(),
    cart(),
    search(),
  ];
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: "favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: "Profile",
              ),
            ],
            currentIndex: select,
            onTap: (index) {
              select = index;
              setState(() {});
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        body: pages[select]);
  }
}
