import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icon/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(
                USizes.productImageRadius * 2,
              ),
              child: Center(
                child: Image(image: AssetImage(UImages.productImage4a)),
              ),
            ),
          ),
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => URoundedImage(
                  width: 80,
                  backgroundColor: dark ? UColors.dark : UColors.white,
                  padding: EdgeInsets.all(USizes.sm),
                  border: Border.all(color: UColors.primary),
                  imageUrl: UImages.productImage1,
                ),
              ),
            ),
          ),
          UAppBar(
            showBackArrow: true,
            actions: [
              UCircularIcon(icon: Iconsax.heart5, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
