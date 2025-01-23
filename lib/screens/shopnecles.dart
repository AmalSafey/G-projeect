import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/customfield/customstack.dart';

class shopnecles extends StatelessWidget {
  static String routname = "shopnecles";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          );
        }),
        title: Text(
          "Innova",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Image.asset("lib/assets/image-13.png"),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 80,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Handcrafts Carpets",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60)),
              ),
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Search by name",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey), // Hint text color
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey), // Icon color
                                filled: true,
                                fillColor:
                                    Colors.white, // TextField background color
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none, // Remove border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Range From",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 45),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.grey), // Hint text color
                              filled: true,
                              fillColor:
                                  Colors.white, // TextField background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none, // Remove border
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "To",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(width: 20),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.grey), // Hint text color
                              filled: true,
                              fillColor:
                                  Colors.white, // TextField background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none, // Remove border
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Search by Location",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey), // Hint text color
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey), // Icon color
                                filled: true,
                                fillColor:
                                    Colors.white, // TextField background color
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none, // Remove border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Find out more and give us more power to complete our journey",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap:
                  true, // Ensures GridView takes only as much space as needed
              physics:
                  NeverScrollableScrollPhysics(), // Disable internal scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4, // Aspect ratio of each grid item
              ),
              itemCount: 20, // Total number of items in the grid
              itemBuilder: (context, index) {
                return stacklisthandmade();
              },
            ),
          ],
        ),
      ),
    );
  }
}
