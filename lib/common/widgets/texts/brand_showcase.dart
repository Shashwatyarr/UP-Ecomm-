import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecomm/features/shop/screens/brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/rounded_container.dart';
import '../brands/brand_cart.dart';

class UBrandShowcase extends StatelessWidget {
  const UBrandShowcase({
    super.key, required this.images, required this.brand,
  });

  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: ()=>Get.to(()=> BrandProductsScreen(title: brand.name, brand: brand)),
      child: URoundedContainer(
        showBorder: true,
        borderColor: UColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(USizes.md),
        margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UBrandCard(
              brand: brand,
              showBorder: false,
            ),
            Row(
              children: images.map((image) => buildBrandImage(dark,image)).toList(),
            )
          ],
        ),
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
            child: CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,progressIndicatorBuilder: (context, url, progress) => UShimmerEffect(width: 100, height: 100),errorWidget: (context, url, error) => Icon(Icons.error),)
          ),
    );
  }
}
