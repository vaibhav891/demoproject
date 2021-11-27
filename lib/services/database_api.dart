import 'dart:convert';

import 'package:demoproject/data_models/category.dart';
import 'package:demoproject/data_models/product.dart';
import 'package:http/http.dart' as http;

class DatabaseAPI {
  List<Category> categories = [];
  List<Product> products = [];
  fetchDB() async {
    var request = http.Request(
        'GET', Uri.parse('https://stark-spire-93433.herokuapp.com/json'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      for (var category in jsonDecode(body)['categories']) {
        // if ((category['child_categories'] as List).isNotEmpty) {
        categories.add(Category.fromJson(category));
        // }
        if ((category['products'] as List).isNotEmpty) {
          for (var product in category['products']) {
            products.add(Product.fromJson(product, category['id']));
          }
        }
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}
