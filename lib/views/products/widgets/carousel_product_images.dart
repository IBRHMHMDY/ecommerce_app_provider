import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:flutter/material.dart';

class CarouselProductImages extends StatelessWidget {
  final Function(int) onchange;
  final String image; // صورة واحدة
  final int currentImage;
  final String heroTag;
  final int initialIndex;

  const CarouselProductImages({
    super.key,
    required this.onchange,
    required this.image,
    required this.currentImage,
    required this.heroTag,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialIndex);

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            onPageChanged: onchange,
            itemCount: 5, // ✅ كررها 5 مرات
            itemBuilder: (context, index) {
              final imgWidget = ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                ),
              );

              // ✅ لفّ الصورة الحالية فقط بالـ Hero
              if (index == currentImage) {
                return Hero(
                  tag: heroTag,
                  createRectTween: (begin, end) =>
                      MaterialRectArcTween(begin: begin, end: end),
                  child: imgWidget,
                );
              } else {
                return imgWidget;
              }
            },
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: currentImage == index ? 20 : 10,
              height: 10,
              margin: const EdgeInsets.only(right: 3),
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
