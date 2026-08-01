import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/banner/banner_controller.dart';
import '../../../controllers/home/home_controller.dart';

class BannersDotNavigation extends StatelessWidget {
  const BannersDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BannerController.instance;
    final bannerController=Get.put(BannerController());
    return Obx(
      ()=> SmoothPageIndicator(
        count: bannerController.banners.length,
        effect: ExpandingDotsEffect(
          dotHeight: 6.0,
        ), controller: PageController(initialPage: controller.currentIndex.value),
      ),
    );
  }
}
