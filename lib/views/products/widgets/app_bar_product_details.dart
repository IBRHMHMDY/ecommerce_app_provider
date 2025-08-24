import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:flutter/material.dart';

class AppBarProductDetails extends StatelessWidget {
  const AppBarProductDetails({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        Text(
          product.title,
          style: TextStyle(color: AppColors.textDark, fontSize: 16,fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_outlined),
            ),
            SizedBox(width: 3),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ],
        ),
      ],
    );
  }
}
