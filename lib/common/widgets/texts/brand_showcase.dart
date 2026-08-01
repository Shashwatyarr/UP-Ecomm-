import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/rounded_container.dart';
import '../brands/brand_cart.dart';

class UBrandShowcase extends StatelessWidget {
  const UBrandShowcase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.md),
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UBrandCard(
            brand: BrandModel.empty(),
            showBorder: false,
          ),
          Row(
            children: images.map((image) => buildBrandImage(dark,image)).toList(),
          )
        ],
      ),
    );
  }

  Widget buildBrandImage(bool dark,String image) {
    return Expanded(
      child: URoundedContainer(
            height: 100,
            margin: const EdgeInsets.only(right: USizes.md),
            padding: EdgeInsets.all(USizes.md),
            backgroundColor: dark?UColors.darkGrey:UColors.light,
            child: Image(image: AssetImage(image),fit: BoxFit.contain,),
          ),
    );
  }
}
