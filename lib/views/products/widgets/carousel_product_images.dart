import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

class CarouselProductImages extends StatelessWidget {
  final Function(int) onchange;
  final String images;
  final int currentImage;
  const CarouselProductImages({
    super.key,
    required this.onchange,
    required this.images,
    required this.currentImage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            onPageChanged: onchange,
            itemBuilder: (context, index) => Image.asset(images),
            itemCount: 5,
            allowImplicitScrolling: true,
            scrollBehavior: ScrollBehavior(),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => AnimatedContainer(
              duration: Duration(microseconds: 300),
              width: currentImage == index ? 20 : 10,
              height: 10,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                color: currentImage == index
                    ? AppColors.textDark
                    : Colors.transparent,
                border: Border.all(
                  color: currentImage == index
                      ? Colors.transparent
                      : AppColors.textDark,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
