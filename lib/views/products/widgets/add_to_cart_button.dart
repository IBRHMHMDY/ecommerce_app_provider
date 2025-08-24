import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.textDark,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            GestureDetector(
              onTap: (){},
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
