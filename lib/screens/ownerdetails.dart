import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/customfield/customstack.dart';
import 'package:flutter_application_graduation/screens/add.dart';
import 'package:flutter_application_graduation/screens/contract.dart';
import 'package:flutter_application_graduation/screens/detailspageforownerandinvestor.dart';
import 'package:flutter_application_graduation/screens/detailsscreen.dart';
import 'package:flutter_application_graduation/screens/detailsscreencard.dart';
import 'package:flutter_application_graduation/screens/profile.dart';
import 'package:flutter_application_graduation/screens/profileinvestor.dart';
import 'package:flutter_application_graduation/screens/searchinvestor.dart';
import 'package:flutter_application_graduation/screens/shopnecles.dart';

class ownerdetails extends StatefulWidget {
  static String routname = "ownerdetails";

  @override
  State<ownerdetails> createState() => _ownerdetailsState();
}

class _ownerdetailsState extends State<ownerdetails> {
  int select = 0;
  List<Widget> tabs = [
    Detailspageforownerandinvestor(),
    add(),
    contract(),
    searchinvestor(),
    profileinvestordessign(
      firstnameController: '',
      lastnameController: '',
      emailController: '',
      passwordController: '',
      cityController: '',
      phoneNumber: '',
      role: '',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Innova',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 24,
                backgroundImage:
                    AssetImage('assets/images/image-13.png'), // ضع الصورة هنا
              ),
            ),
          ],
        ),
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
                  Icons.add,
                ),
                label: "add",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.show_chart,
                ),
                label: "invest",
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
        body: tabs[select]);
  }
}

class ContainerOwner extends StatelessWidget {
  ContainerOwner(
      {super.key, required this.icon, required this.label, required this.num});

  IconData icon;
  String label;
  String num;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              )), // Icon:

          Text(
            label, // text:
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),

          // container:
          Container(
            //margin: EdgeInsets.only(left: 30),
            //padding: const EdgeInsets.only(left: 10, right: 10),
            width: 90,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                num,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
