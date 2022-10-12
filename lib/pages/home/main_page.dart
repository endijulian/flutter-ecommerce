// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/home/chat_page.dart';
import 'package:flutter_ecommerce/pages/home/home_page.dart';
import 'package:flutter_ecommerce/pages/home/profile_page.dart';
import 'package:flutter_ecommerce/pages/home/wishlist_page.dart';
import 'package:flutter_ecommerce/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndexBottomBar = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
          height: 18,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndexBottomBar,
            onTap: (value) {
              print(value);
              setState(() {
                currentIndexBottomBar = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: currentIndexBottomBar == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    width: 21,
                    color: currentIndexBottomBar == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 21,
                    color: currentIndexBottomBar == 2
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 18,
                    color: currentIndexBottomBar == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    body() {
      switch (currentIndexBottomBar) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
