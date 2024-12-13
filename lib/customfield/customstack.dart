import 'package:flutter/material.dart';

class stacklist extends StatelessWidget {
  const stacklist({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 246,
        width: 170,
        color: Colors.white,
      ),
      Image.asset(
        "lib/assets/image-8.png",
      ),
      Positioned(
        bottom: 10,
        child: Column(
          children: [
            Text(
              "RucksackEmbroideredBag",
              style: TextStyle(fontSize: 12),
            ),
            Text("Made by Amira", style: TextStyle(fontSize: 15)),
            Text("28.00"),
            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text(" In stock")
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text("4521")
              ],
            )
          ],
        ),
      )
    ]);
  }
}

class stacklistcart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 246,
        width: 170,
        color: Colors.white,
      ),
      Image.asset(
        "lib/assets/image-4.png",
      ),
      Positioned(
        bottom: 10,
        child: Column(
          children: [
            Text(
              "RucksackEmbroideredBag",
              style: TextStyle(fontSize: 12),
            ),
            Text("Made by Amira", style: TextStyle(fontSize: 15)),
            Text("28.00"),
            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text(" In stock")
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text("4521")
              ],
            )
          ],
        ),
      )
    ]);
  }
}

class stacklisthandmade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: 113,
        color: Colors.white,
      ),
      Image.asset(
        "lib/assets/image-11.png",
      ),
      Positioned(
        bottom: 10,
        child: Column(
          children: [
            Text(
              "Shop Necklaces",
              style: TextStyle(fontSize: 12),
            ),
            Text("Made by Amira", style: TextStyle(fontSize: 15)),
            Text("28.00"),
            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text(" In stock")
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text("4521")
              ],
            )
          ],
        ),
      )
    ]);
  }
}
