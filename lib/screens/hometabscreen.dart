import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/customfield/customstack.dart';
import 'package:flutter_application_graduation/screens/detailsscreen.dart';

class hometabscreen extends StatelessWidget {
  static String routname = "hometabscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          color: Colors.blue,
          width: double.infinity,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search any Product',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey), // Icon color
                filled: true,
                fillColor: Colors.white, // TextField background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none, // Remove border
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "Categories",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 75,
          width: double.infinity,
          color: const Color.fromARGB(255, 150, 200, 241),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Women",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Men",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Kids",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Fashion",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Watches",
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Blankets ",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Jewelry ",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Earrings ",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Drawing ",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Necklace ",
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              child: Image.asset(
                "lib/assets/photo_5963203499837737121_x.jpg",
                fit: BoxFit.fill,
              ),
              width: double.infinity,
              height: 200,
            ),
            Positioned(
              top: 30,
              left: 10,
              child: Column(
                children: [
                  Text(
                    "50-40 % off",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "Now in (product)",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    "All Color",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            )
          ],
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
            Text(
              "Show All >>",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
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
            Text(
              "Show All >>",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
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
      ]),
    ));
  }
}
