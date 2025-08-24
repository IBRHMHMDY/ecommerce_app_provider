import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/cupertino.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              "assets/images/icon.png",
              height: 20,
              width: 20,
              cacheHeight: 20,
              cacheWidth: 20,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(CupertinoIcons.bell, size: 25),
          ),
        ),
      ],
    );
  }
}
