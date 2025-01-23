import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/customfield/customstack.dart';
import 'package:flutter_application_graduation/screens/detailsscreen.dart';
import 'package:flutter_application_graduation/screens/detailsscreencard.dart';
import 'package:flutter_application_graduation/screens/ownerdetails.dart';
import 'package:flutter_application_graduation/screens/shopnecles.dart';

class Detailspageforownerandinvestor extends StatelessWidget {
  static String routname = "Detailspageforownerandinvestor";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                hintText: 'Search any Product...',
                hintStyle: const TextStyle(color: Colors.blue, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  'Mohamed',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'here’s a quick look at your products Journey!',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          ContainerOwner(
              icon: Icons.currency_pound,
              label: 'Total Currency',
              num: '\$ 63,656'),
          ContainerOwner(icon: Icons.person, label: 'Total Users', num: '1236'),
          ContainerOwner(
              icon: Icons.flash_on, label: 'Total Views', num: '33656'),
          ContainerOwner(
              icon: Icons.check_circle, label: 'Total Products', num: '23'),
          const Center(
            child: Text(
              'For Specific Details of your Data',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 13.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: const Text(
              'Go To Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 120,
                    child: Image.asset("lib/assets/image.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 30,
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Art",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    child: Image.asset("lib/assets/image-1.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 25,
                    child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Jewelry",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    child: Image.asset("lib/assets/image-2.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 25,
                    child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Bags",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 120,
                    child: Image.asset("lib/assets/image-3.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 30,
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 120,
                    child: Image.asset("lib/assets/image-4.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 35,
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Carpts",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Best Selling Products ",
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AllProductsGrid.routname);
                },
                child: Text(
                  "Show All >>",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return stacklist();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 7,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Handcrafts Carpets ",
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                onTap: () => {
                  Navigator.pushNamed(context, AllProductsGridcards.routname)
                },
                child: Text(
                  "Show All >>",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return stacklistcart();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 7,
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Shop Necles ",
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, shopnecles.routname);
                },
                child: Text(
                  "Show All >>",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return stacklisthandmade();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 7,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
