import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/core/routes.dart';
import 'package:ecommerce_app_provider/views/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/navigation_service.dart';
import 'controllers/product_controller.dart';
import 'controllers/cart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECommerce App',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        navigatorKey: NavigationService
            .navigatorKey, // << ربط الـ navigator بالـ NavigationService
        initialRoute: AppRoutes.home,
        home: AppScreens(),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
