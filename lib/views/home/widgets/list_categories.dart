import 'package:ecommerce_app_provider/services/data/categories_data.dart';
import 'package:flutter/material.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(categories[index].imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(height: 10),
              Text(
                categories[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: categories.length,
      ),
    );
  }
}
