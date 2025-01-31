import 'package:flutter/material.dart';

class Category {
  int id;
  String name;
  String urlimage;
  Category({required this.id, required this.name, required this.urlimage});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['Id'],
      name: json['Name'],
      urlimage: json['ImageUrl'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'ImageUrl': urlimage,
    };
  }
}

class ProductModel {
  String name;
  String description;
  String homeImage;
  List<String> images;
  double price;
  bool isAvailable;
  int stock;
  String author;

  ProductModel({
    required this.name,
    required this.description,
    required this.homeImage,
    required this.images,
    required this.price,
    required this.isAvailable,
    required this.stock,
    required this.author,
  });

  // Factory method to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['ProductName'],
      description: json['ProductDescription'],
      homeImage: json['HomePicture'],
      images: List<String>.from(json['ProductPictures']),
      price: json['ProductPrice'].toDouble(),
      isAvailable: json['IsAvailable'],
      stock: json['Stock'],
      author: json['AuthorName'],
    );
  }

  // Convert a ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'ProductName': name,
      'ProductDescription': description,
      'HomePicture': homeImage,
      'ProductPictures': images,
      'ProductPrice': price,
      'IsAvailable': isAvailable,
      'Stock': stock,
      'AuthorName': author,
    };
  }
}

class CategoryModel {
  String title;
  String description;
  List<ProductModel> products;

  CategoryModel({
    required this.title,
    required this.description,
    required this.products,
  });

  // Factory method to create a CategoryModel from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['CategoryName'],
      description: json['CategoryDescription'] ?? "",
      products: (json['AllProductsOnspecificCategories'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }

  // Convert a CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'CategoryName': title,
      'CategoryDescription': description,
      'AllProductsOnspecificCategories':
          products.map((p) => p.toJson()).toList(),
    };
  }
}

class CategoryItem {
  final int categoryId;
  final String categoryName;

  CategoryItem({required this.categoryId, required this.categoryName});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      categoryId: json['CategoryId'],
      categoryName: json['CategoryName'],
    );
  }
}
