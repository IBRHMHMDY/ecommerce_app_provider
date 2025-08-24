import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:ecommerce_app_provider/views/products/widgets/app_bar_product_details.dart';
import 'package:ecommerce_app_provider/views/products/widgets/carousel_product_images.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              AppBarProductDetails(product: widget.product),
              SizedBox(height: 15),
              CarouselProductImages(
                onchange: (index) => setState(() {
                  currentImage = index;
                }),
                images: widget.product.image,
                currentImage: currentImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
