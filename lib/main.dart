// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/cart_page.dart';
import 'package:flutter_ecommerce/pages/checkout_page.dart';
import 'package:flutter_ecommerce/pages/checkout_success_page.dart';
import 'package:flutter_ecommerce/pages/detail_chat_page.dart';
import 'package:flutter_ecommerce/pages/edit_profile_page.dart';
import 'package:flutter_ecommerce/pages/home/main_page.dart';
import 'package:flutter_ecommerce/pages/product_page.dart';
import 'package:flutter_ecommerce/pages/sign_in_page.dart';
import 'package:flutter_ecommerce/pages/sign_up_page.dart';
import 'package:flutter_ecommerce/pages/splash_page.dart';
import 'package:flutter_ecommerce/theme.dart';
// ignore: import_of_legacy_library_into_null_safe

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
