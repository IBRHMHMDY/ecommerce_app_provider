import 'package:ecommerce_app_provider/views/cart/cart_screen.dart';
import 'package:ecommerce_app_provider/views/favorites/favorites_screen.dart';
import 'package:ecommerce_app_provider/views/home/home_screen.dart';
import 'package:ecommerce_app_provider/views/menu/menu_screen.dart';
import 'package:ecommerce_app_provider/views/profile/profile_screen.dart';
import 'package:ecommerce_app_provider/widgets/bottom_nav_bar.dart';
import 'package:ecommerce_app_provider/widgets/button_home.dart';
import 'package:flutter/material.dart';

class AppScreens extends StatefulWidget {
  const AppScreens({super.key});

  @override
  State<AppScreens> createState() => _AppScreensState();
}

class _AppScreensState extends State<AppScreens> {
  int currentIndex = 2;

  final List<Widget> screens = [
    MenuScreen(),
    FavoritesScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBar(currentIndex: currentIndex,onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },),
      floatingActionButton: ButtonHome(currentIndex: currentIndex,onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}