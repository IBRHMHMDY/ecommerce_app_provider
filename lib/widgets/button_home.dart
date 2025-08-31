import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

class ButtonHome extends StatefulWidget {
  const ButtonHome({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final Function onTap;
  @override
  State<ButtonHome> createState() => _ButtonHomeState();
}

class _ButtonHomeState extends State<ButtonHome> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: widget.currentIndex == 2
          ? AppColors.primaryColor
          : AppColors.accentColor,
      child: Icon(
        Icons.home_outlined,
        size: 28,
        color: widget.currentIndex == 2
            ? AppColors.backgroundColor
            : AppColors.textLight,
      ),
      onPressed: () {
        setState(() {
          widget.onTap(2);
        });
      },
    );
  }
}
