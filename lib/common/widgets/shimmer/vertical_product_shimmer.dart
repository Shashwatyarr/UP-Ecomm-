
import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class UVerticalProductShimmer extends StatelessWidget {
  const UVerticalProductShimmer({
    super.key,
    this.itemCount = 16
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return UGridLayout(
        itemCount: itemCount,
        itemBuilder: (context, index) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              UShimmerEffect(width: 180, height: 180),
              SizedBox(height: USizes.spaceBtwItems,),

              /// Text
              UShimmerEffect(width: 160, height: 15),
              SizedBox(height: USizes.spaceBtwItems / 2,),
              UShimmerEffect(width: 110, height: 15)
            ],
          ),
        ),
    );
  }
}
