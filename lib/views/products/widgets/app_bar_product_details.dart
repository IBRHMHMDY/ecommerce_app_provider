import 'package:ecommerce_app_provider/controllers/favorite_controller.dart';
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/core/routes.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:ecommerce_app_provider/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';

class AppBarProductDetails extends StatelessWidget {
  const AppBarProductDetails({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
  final provider = FavoriteController.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackIconButton(onPressed: () => Navigator.pushNamed(context,AppRoutes.home)),
        Text(
          product.title,
          style: TextStyle(color: AppColors.textDark, fontSize: 16,fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.share_outlined),
            ),
            SizedBox(width: 3),
            IconButton(
              onPressed: ()=>provider.toggleFavorites(product),
              icon: Icon(provider.isFavorite(product) ? Icons.favorite : Icons.favorite_outline,color: provider.isFavorite(product) ? AppColors.primaryColor : Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
