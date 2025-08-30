
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({
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
              Icons.favorite_outline,
              color: AppColors.textLight,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              "YourFavorites is Empty",
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
