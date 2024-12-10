import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/screens/cart.dart';
import 'package:flutter_application_graduation/screens/favourit.dart';
import 'package:flutter_application_graduation/screens/hometabscreen.dart';
import 'package:flutter_application_graduation/screens/profile.dart';
import 'package:flutter_application_graduation/screens/search.dart';

class homescreen extends StatefulWidget {
  static const routname = "home";

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Homescreen",
          style: TextStyle(color: Colors.brown),
        ),
      ),
      backgroundColor: Colors.brown,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          items: [
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
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
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
          selectedLabelStyle: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: tabs[select],
    );
  }

  List<Widget> tabs = [
    hometabscreen(),
    favourit(),
    cart(),
    search(),
    profile()
  ];
}
