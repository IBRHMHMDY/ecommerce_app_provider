import 'package:ecommerce_app_provider/controllers/cart_controller.dart';
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/core/routes.dart';
import 'package:ecommerce_app_provider/views/cart/widgets/cart_empty.dart';
import 'package:ecommerce_app_provider/views/cart/widgets/cart_summary.dart';
import 'package:ecommerce_app_provider/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showSummary = false;
  final TextEditingController couponController = TextEditingController();
  int itemAmount = 1;
  @override
  Widget build(BuildContext context) {
    final provider = CartController.of(context);
    final itemsCart = provider.cart;
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  BackIconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.home),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "My Cart",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: provider.cartCount == 0
                    ? CartEmpty()
                    : ListView.builder(
                        itemCount: itemsCart.length,
                        itemBuilder: (context, index) {
                          final cartItems = itemsCart[index];
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: double.infinity,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.backgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 100,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.accentColor,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(context, AppRoutes.productDetails,arguments: cartItems.product),
                                          child: Image.asset(
                                            cartItems.product.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 15,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItems.product.title,
                                              style: TextStyle(
                                                color: AppColors.textDark,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              cartItems.product.category,
                                              style: TextStyle(
                                                color: AppColors.textLight,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "\$${cartItems.product.price.toString()}",
                                              style: TextStyle(
                                                color: AppColors.textDark,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 15,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: AppColors.accentColor,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            /// --- Quantity Selector ---
                                            IconButton(
                                              onPressed: () {
                                                if (itemsCart[index].quantity >
                                                    1) {
                                                  provider.minusAmount(
                                                    index,
                                                    itemsCart,
                                                  );
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: AppColors.textDark,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              provider
                                                  .getQuantity(
                                                    itemsCart[index].product.id,
                                                  )
                                                  .toString(),
                                              style: const TextStyle(
                                                color: AppColors.textDark,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () => provider
                                                  .plusAmount(index, itemsCart),
                                              icon: const Icon(
                                                Icons.add,
                                                color: AppColors.textDark,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        provider.removeFromCart(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.red.shade600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              if (provider.cartCount > 0)
                CartSummary(showSummary: showSummary, couponController: couponController),
            ],
          ),
        ),
      ),
    );
  }
}
