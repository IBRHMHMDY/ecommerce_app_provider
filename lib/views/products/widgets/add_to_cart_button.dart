import 'package:ecommerce_app_provider/controllers/cart_controller.dart';
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  final ProductModel product;
  const AddToCartButton({super.key, required this.product});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartController.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        height: 85,
        width: 350,
        decoration: BoxDecoration(
          color: AppColors.textDark,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => quantity != 1
                          ? setState(() {
                              quantity--;
                            })
                          : 1,
                      icon: Icon(Icons.remove, color: Colors.white, size: 20),
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        quantity++;
                      }),
                      icon: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  provider.toggleCart(widget.product);
                  const snackBar = SnackBar(
                    content: Text(
                      "Added Succefully!",
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        backgroundColor: AppColors.textDark,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primaryColor,
                  ),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
