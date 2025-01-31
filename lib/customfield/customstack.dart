import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/apiforcatigories.dart';

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
  final ProductModel product;

  stacklistcart({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          width: 200,
          color: Colors.white,
        ),
        Image.network(
          product.homeImage,
          height: 120,
          width: 160,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Made by ${product.author}",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.favorite_border_outlined),
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 20),
                  Icon(
                    Icons.check,
                    color: product.isAvailable ? Colors.green : Colors.red,
                  ),
                  Text(product.isAvailable ? " In stock" : " Out of stock")
                ],
              ),
              Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellow,
                  );
                })
                  ..add(Text("4521")), // Placeholder rating count
              )
            ],
          ),
        )
      ],
    );
  }
}

/*class stacklistcart extends StatelessWidget {
  ProductModel product;
  stacklistcart({required this.product});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 246,
        width: 170,
        color: Colors.white,
      ),
      Image.network(
        product.homeImage,
      ),
      Positioned(
        bottom: 10,
        child: Column(
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 12),
            ),
            Text(product.author, style: TextStyle(fontSize: 15)),
            Text(product.price.toString()),
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
                Text(product.stock.toString())
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
*/
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
