import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/apibase.dart';
import 'package:flutter_application_graduation/api/apiforcatigories.dart';

class containerrefactor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: double.infinity,
        color: const Color.fromARGB(255, 150, 200, 241),
        child: FutureBuilder<List<String>>(
          future: ApiManagercatigory.getallitems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading categories'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No categories found'));
            }

            // List of category names
            List<String> categories = snapshot.data!;

            return Column(
              children: [
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: categories
                      .map((category) => Text(category,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)))
                      .toList(),
                ),
              ],
            );
          },
        ));
  }
}

class discountcontainer extends StatelessWidget {
  const discountcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class containersearch extends StatelessWidget {
  const containersearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search any Product',
            hintStyle: TextStyle(color: Colors.grey), // Hint text color
            prefixIcon: Icon(Icons.search, color: Colors.grey), // Icon color
            filled: true,
            fillColor: Colors.white, // TextField background color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none, // Remove border
            ),
          ),
        ),
      ),
    );
  }
}

class stackrefactor extends StatelessWidget {
  Category catigory;
  stackrefactor({required this.catigory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: 120,
          child: Image.network(catigory.urlimage),
        ),
        Positioned(
          bottom: 50,
          left: 30,
          child: Container(
              width: 60,
              decoration: BoxDecoration(
                // Semi-transparent background for visibility
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: Text(
                  catigory.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
