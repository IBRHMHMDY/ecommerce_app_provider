
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.textLight,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              "YourCart is Empty",
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ],
        ),
      );
  }
}
