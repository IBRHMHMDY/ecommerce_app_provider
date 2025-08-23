import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.search, size: 30, color: AppColors.textLight),
            SizedBox(width: 10),
            Flexible(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 1.5,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textLight),
              ),
            ),
            SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.tune, size: 30, color: AppColors.textLight),
            ),
          ],
        ),
      ),
    );
  }
}
