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
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              "assets/images/icon.png",
              height: 30,
              width: 30,
              cacheHeight: 30,
              cacheWidth: 30,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(CupertinoIcons.bell, size: 30),
          ),
        ),
      ],
    );
  }
}
