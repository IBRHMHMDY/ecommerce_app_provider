import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:ecommerce_app_provider/views/products/widgets/app_bar_product_details.dart';
import 'package:ecommerce_app_provider/views/products/widgets/carousel_product_images.dart';
import 'package:ecommerce_app_provider/views/products/widgets/row_info.dart';
import 'package:ecommerce_app_provider/views/products/widgets/tab_product_details.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentImage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: AppColors.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      // Title
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      // Price
                      Text(
                        "\$${widget.product.price.toString()}",
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // Rating, Reviews, Category
                      RowInfo(widget: widget),
                      SizedBox(height: 25),
                      // Colors
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Color",
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              widget.product.colors.length,
                              (index) => GestureDetector(
                                onTap: () => setState(() {
                                  currentColor = index;
                                }),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 35,
                                  height: 35,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentColor == index
                                        ? Colors.white
                                        : widget.product.colors[index],
                                    border: currentColor == index
                                        ? Border.all(
                                            color: widget.product.colors[index],
                                          )
                                        : null,
                                  ),
                                  padding: currentColor == index
                                      ? EdgeInsets.all(2)
                                      : null,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.product.colors[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: TabProductDetails()),
                    ],
                  ),
                ),
              ),
            ),
                     
          ],
        ),
      ),
    );
  }
}
