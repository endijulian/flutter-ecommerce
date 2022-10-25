import 'dart:convert';
import 'package:flutter_ecommerce/models/users_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "http://192.168.43.198:8000/api";

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];

      return user;
    } else {
      throw Exception("Gagal Register !!");
    }
  }

  Future<UserModel> login({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'email': email,
        'password': password,
      },
    );

    var response = await http.post(
      // url,
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception("Gagal Gagal !!");
    }
  }
}
