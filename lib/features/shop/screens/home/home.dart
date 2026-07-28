import 'package:ecomm/features/shop/controllers/home/home_controller.dart';
import 'package:ecomm/features/shop/screens/home/widgets/Promo_slider.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecomm/common/custom_shapes/primary_header_container.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UHomeAppBar(),
                        SizedBox(height: USizes.spaceBtwSections),
                        UHomeCategories(),
                      ],
                    ),
                  ),
                ),
                USearchBar(),
              ],
            ),
            SizedBox(height: USizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  UPromoSlider(
                    banners: [
                      UImages.homeBanner1,
                      UImages.homeBanner2,
                      UImages.homeBanner3,
                      UImages.homeBanner4,
                      UImages.homeBanner5,
                    ],
                  ),
                  const SizedBox(height: USizes.spaceBtwSections),
                  USectionHeading(title: 'Popular Products', onPressed: () {}),
                  SizedBox(height: USizes.spaceBtwItems),
                  UGridLayout(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return UProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
