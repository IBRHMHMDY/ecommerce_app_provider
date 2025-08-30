import 'package:ecommerce_app_provider/controllers/cart_controller.dart';
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/models/cart_model.dart';
import 'package:ecommerce_app_provider/models/product_model.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  final ProductModel product;
  const AddToCartButton({super.key, required this.product});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int itemAmount = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartController.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              /// --- Quantity Selector ---
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (itemAmount > 1) {
                          setState(() => itemAmount--);
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Text(
                      itemAmount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => itemAmount++),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              /// --- Add to Cart Button ---
              GestureDetector(
                onTap: () {
                  // Convert class: CartModel to item: CartItem
                  final cartItem = CartModel(
                    id: widget.product.id,
                    title: widget.product.title,
                    category: widget.product.category,
                    image: widget.product.image,
                    price: widget.product.price,
                    quantity: itemAmount,
                  );

                  provider.btnAddToCart(cartItem);

                  /// SnackBar
                  final snackBar = SnackBar(
                    showCloseIcon: true,
                    backgroundColor: AppColors.textDark,
                    content: const Text(
                      "Added Successfully! 🛒",
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: const Duration(seconds: 2),
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
                  child: const Text(
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
