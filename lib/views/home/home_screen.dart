import 'package:ecommerce_app_provider/views/home/widgets/list_categories.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_provider/views/home/widgets/app_bar_home.dart';
import 'package:ecommerce_app_provider/views/home/widgets/search_bar_home.dart';
import 'package:ecommerce_app_provider/views/home/widgets/carousel_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              AppBarHome(),
              SizedBox(height: 15),
              SearchBarHome(),
              SizedBox(height: 15),
              CarouselBanner(),
              SizedBox(height: 15),
              ListCategories(),

            ],
          ),
        ),
      ),
    );
  }
}
