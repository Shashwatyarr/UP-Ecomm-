
import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class UHorizontalProductShimmer extends StatelessWidget {
  const UHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: USizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems),
          itemCount: itemCount,
        itemBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// Image
            UShimmerEffect(width: 120, height: 120),
            SizedBox(width: USizes.spaceBtwItems),


            /// Text
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: USizes.spaceBtwItems),

                    /// Title
                    UShimmerEffect(width: 160, height: 15),
                    SizedBox(height: USizes.spaceBtwItems / 2),
                    /// Brand
                    UShimmerEffect(width: 110, height: 15)
                  ],

                ),

                Row(
                  children: [
                    UShimmerEffect(width: 40, height: 20),
                    SizedBox(width: USizes.spaceBtwSections),
                    UShimmerEffect(width: 40, height: 20)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
