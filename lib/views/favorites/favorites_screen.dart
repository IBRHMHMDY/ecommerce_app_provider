import 'package:ecommerce_app_provider/controllers/favorite_controller.dart';
import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/core/routes.dart';
import 'package:ecommerce_app_provider/views/favorites/widgets/favorites_empty.dart';
import 'package:ecommerce_app_provider/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteController.of(context);
    final products = provider.favorites;
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                    "My Favorites",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: provider.favCount == 0
                    ? FavoritesEmpty()
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final favItem = products[index];
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
                                        child: Image.asset(
                                          favItem.image,
                                          fit: BoxFit.cover,
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
                                              favItem.title,
                                              style: TextStyle(
                                                color: AppColors.textDark,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              favItem.category,
                                              style: TextStyle(
                                                color: AppColors.textDark,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "\$${favItem.price.toString()}",
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
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                    onPressed: () => provider
                                        .removeFromFavorites(products[index]),
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
            ],
          ),
        ),
      ),
    );
  }
}
