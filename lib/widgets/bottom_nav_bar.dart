import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final Function(int) onTap;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5,
      height: 60,
      color: AppColors.accentColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => setState(() {
              widget.onTap(0);
            }),
            icon: Icon(
              Icons.menu_outlined,
              size: 28,
              color: widget.currentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.textLight,
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              widget.onTap(1);
            }),
            icon: Icon(
              Icons.favorite_outline,
              size: 28,
              color: widget.currentIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.textLight,
            ),
          ),
          SizedBox(width: 40),
          IconButton(
            onPressed: () => setState(() {
              widget.onTap(3);
            }),
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: widget.currentIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.textLight,
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              widget.onTap(4);
            }),
            icon: Icon(
              Icons.person_outline,
              size: 28,
              color: widget.currentIndex == 4
                  ? AppColors.primaryColor
                  : AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
