import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm/features/shop/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import 'banner_dot_navigation.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((banner) => URoundedImage(imageUrl: banner),).toList(),
          options: CarouselOptions(viewportFraction: 1.0,onPageChanged: (index, reason) => controller.onPageChnaged(index),),
          carouselController: controller.carouselController,
        ),
        SizedBox(height: USizes.spaceBtwItems,),
        BannersDotNavigation(),
      ],
    );
  }
}
