import 'package:ecommerce_app_provider/core/constants.dart';
import 'package:ecommerce_app_provider/services/data/carousel_images_data.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({super.key});

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  int currentSlide = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              allowImplicitScrolling: true,
              onPageChanged: (index) {
                setState(() {
                  currentSlide = index;
                });
              },
              children: List.generate(
                sliders.length,
                (index) => Image(
                  image: AssetImage(sliders[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 15,
          top: 120,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliders.length,
                (index) => AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  width: currentSlide == index ? 20 : 10,
                  height: 10,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    color: currentSlide == index
                        ? AppColors.textDark
                        : Colors.transparent,
                    border: Border.all(
                      color: currentSlide == index
                          ? Colors.transparent
                          : AppColors.textDark,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
