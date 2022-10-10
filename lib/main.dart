// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/sign_in_part.dart';
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
      },
    );
  }
}
