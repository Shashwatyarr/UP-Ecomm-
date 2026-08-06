import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner/banner_controller.dart';
import 'banner_dot_navigation.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {

    final bannerController=Get.put(BannerController());
    final controller = BannerController.instance;
    return Obx(
        () {
          if(bannerController.isLoading.value){
            return UShimmerEffect(width: double.infinity, height: 190);
          }
          if(bannerController.banners.isEmpty){
            return Text('No Banners found');
          }
          return Column(
            children: [
              CarouselSlider(
                items: bannerController.banners
                    .map((banner) =>
                    URoundedImage(
                        imageUrl: banner.imageUrl, isNetworkImage: true,
                      onTap: ()=>Get.toNamed(banner.targetScreen),
                    ),)
                    .toList(),
                options: CarouselOptions(viewportFraction: 1.0,
                  onPageChanged: (index, reason) =>
                      controller.onPageChnaged(index),),
                carouselController: controller.carouselController,
              ),
              SizedBox(height: USizes.spaceBtwItems,),
              BannersDotNavigation(),
            ],
          );
        }
    );
  }
}
