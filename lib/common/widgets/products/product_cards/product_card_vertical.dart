import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/widgets/icon/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedContainer(
              height: 180,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  Center(child: URoundedImage(imageUrl: UImages.productImage15)),
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.sm,
                        vertical: USizes.xs,
                      ),
                      child: Text(
                        '20%',
                        style: Theme
                            .of(
                          context,
                        )
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: UCircularIcon(
                        icon: Iconsax.heart5, color: Colors.red,)
                  ),
                ],
              ),
            ),
            SizedBox(
              height: USizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                UProductTitleText(title: 'Blue Bata Shoes', smallSize: true,),
              SizedBox(height: USizes.spaceBtwItems / 2,),
              UBrandTitleWithVerifyIcon(title: 'Bata'),
              ]
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(price: '65',),
                ),
                Container(
                  width: USizes.iconLg * 1.2,
                  height: USizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(USizes.cardRadiusMd),
                        bottomRight: Radius.circular(
                            USizes.productImageRadius)),
                    color: UColors.primary,
                  ),
                  child: Icon(Iconsax.add, color: UColors.white,),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}




