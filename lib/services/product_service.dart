import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = "http://192.168.43.198:8000/api";

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> product = [];

      for (var item in data) {
        product.add(ProductModel.fromJson(item));
      }

      return product;
    } else {
      throw Exception("Gagal get products");
    }
  }
}
