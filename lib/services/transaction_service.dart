import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = "http://192.168.43.198:8000/api";

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': 'Maresmoon',
        'items': carts
            .map(
              (cart) => {
                'id': cart.product?.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal melakukan checkout");
    }
  }
}
