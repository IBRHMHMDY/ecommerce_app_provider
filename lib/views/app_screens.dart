import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/views/cart/cart_screen.dart';
import 'package:ecommerce_app_provider/views/favorites/favorites_screen.dart';
import 'package:ecommerce_app_provider/views/home/home_screen.dart';
import 'package:ecommerce_app_provider/views/menu/menu_screen.dart';
import 'package:ecommerce_app_provider/views/profile/profile_screen.dart';
import 'package:ecommerce_app_provider/widgets/bottom_nav_bar.dart';
import 'package:ecommerce_app_provider/widgets/button_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScreens extends StatefulWidget {
  const AppScreens({super.key});

  @override
  State<AppScreens> createState() => _AppScreensState();
}

class _AppScreensState extends State<AppScreens> {
  DateTime? lastPressed;
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
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final now = DateTime.now();

        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Press Again to Exit",
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          // خروج من التطبيق
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        floatingActionButton: isKeyboardOpen
            ? null
            : ButtonHome(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
