import 'package:ecommerce_app_provider/controllers/cart_controller.dart';
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
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
          InkWell(
            onTap: () => setState(() {
              widget.onTap(3);
            }),
            child: Consumer<CartController>(
              builder: (context, cartController, child) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    cartController.cartCount > 0
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    size: 28,
                    color: widget.currentIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.textLight,
                  ),
                  Positioned(
                    right: -2,
                    top: -8,
                    child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: cartController.cartCount > 0 ? AppColors.primaryColor : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              cartController.cartCount.toString(),
                              style: TextStyle(
                                color: cartController.cartCount > 0? AppColors.backgroundColor : Colors.transparent,
                                fontSize: 12,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                          )
                        
                  ),
                ],
              ),
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
