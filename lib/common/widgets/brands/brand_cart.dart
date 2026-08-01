import 'package:ecomm/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../../custom_shapes/rounded_container.dart';
import '../images/rounded_image.dart';
import '../texts/brand_title_with_verify_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder=true, this.onTap,
    required this.brand,
  });
  final bool showBorder;
  final VoidCallback? onTap;

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(child: URoundedImage(imageUrl: brand.image,isNetworkImage: true,backgroundColor: Colors.transparent,)),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UBrandTitleWithVerifyIcon(title: brand.name,brandTextSize: TextSizes.large,),
                  Text(brand.productsCount.toString()+' Products',style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
