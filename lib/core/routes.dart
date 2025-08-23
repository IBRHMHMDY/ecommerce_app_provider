import 'package:ecommerce_app_provider/views/products/product_details_screen.dart';
import 'package:flutter/material.dart';

// Import Screens
import '../../views/home/home_screen.dart';
import '../../views/cart/cart_screen.dart';

class AppRoutes {
  // أسماء الـ routes
  static const String home = '/';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';

  // مولد الـ routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case productDetails:
        // final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(),
        );

      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => ScaffoldMessenger(child: Text("Screen Not Found")),
        );
    }
  }
}
