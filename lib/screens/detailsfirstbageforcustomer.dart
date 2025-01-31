import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/apibase.dart';
import 'package:flutter_application_graduation/api/apiforcatigories.dart';
import 'package:flutter_application_graduation/customfield/customstack.dart';
import 'package:flutter_application_graduation/screens/containerrefactor.dart';
import 'package:flutter_application_graduation/screens/detailsscreen.dart';
import 'package:flutter_application_graduation/screens/detailsscreencard.dart';
import 'package:flutter_application_graduation/screens/shopnecles.dart';

class detailsfirstscreencustomer extends StatefulWidget {
  static const String routname = "detailsfirstscreencustomer";

  @override
  State<detailsfirstscreencustomer> createState() =>
      _detailsfirstscreencustomerState();
}

class _detailsfirstscreencustomerState
    extends State<detailsfirstscreencustomer> {
  late Future<List<Category>> futureCategories;
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureCategories = ApiManagercatigory.getCategories();
    futureProducts = ApiManagercatigory.fetchCarpetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        containersearch(),
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
        containerrefactor(),
        SizedBox(
          height: 10,
        ),
        discountcontainer(),
        FutureBuilder<List<Category>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // مؤشر تحميل
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // عرض خطأ
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No categories available.'));
              }

              List<Category> categories = snapshot.data!;

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categories.take(3).map((category) {
                      return stackrefactor(catigory: category);
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: categories.skip(3).take(2).map((category) {
                      return stackrefactor(catigory: category);
                    }).toList(),
                  ),
                ],
              );
            }),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        SizedBox(
          height: 10,
        ),
        FutureBuilder<List<ProductModel>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No products available."));
            }

            List<ProductModel> products = snapshot.data!;

            return Container(
              height: 250,
              child: ListView.separated(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return stacklistcart(product: products[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 7);
                },
              ),
            );
          },
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
      ]),
    );
  }
}
