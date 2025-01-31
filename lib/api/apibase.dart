import 'dart:convert';
import 'package:flutter_application_graduation/api/apiforcatigories.dart';
import 'package:http/http.dart' as http;

class ApiManagercatigory {
  static String baseUrl = 'innova-hub.premiumasp.net';

  static Future<List<Category>> getCategories() async {
    var url = Uri.https(baseUrl, '/api/Category/getPopularCategories');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData.map<Category>((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<CategoryModel> fetchCategory() async {
    final response = await http.get(Uri.parse(
        'https://innova-hub.premiumasp.net/api/Category/getProductsByCategory/1'));

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load category');
    }
  }

  static Future<List<ProductModel>> fetchCarpetProducts() async {
    final response = await http.get(Uri.parse(
        'https://innova-hub.premiumasp.net/api/Category/getProductsByCategory/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      CategoryModel category = CategoryModel.fromJson(data);
      return category.products; // Returning the list of products
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<String>> getallitems() async {
    final response = await http.get(
      Uri.parse(
          'https://innova-hub.premiumasp.net/api/Category/getAllCategories'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map<String>((json) => CategoryItem.fromJson(json).categoryName)
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}





/*import 'package:http/http.dart' as http;

import 'dart:convert';

class AuthService {
  static const String baseUrl = 'https://localhost:7151/api/Account';
  static const String registerApi = '$baseUrl/register';
  static const String loginApi = '$baseUrl/login';

  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String city,
    required String country,
    required String district,
    required String phoneNumber,
    required String roleId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(registerApi),
        headers: {
          'Content-Type': 'application/json', // Specify that the body is JSON
        },
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "city": city,
          "phoneNumber": phoneNumber,
          "district": district,
          "country": country,
          "roleId": roleId,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Successful registration
      } else {
        // Handle error response
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        throw Exception(errorResponse['Message'] ??
            'Failed to register. Please try again.');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
*/