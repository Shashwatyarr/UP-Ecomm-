
import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class UListTileShimmer extends StatelessWidget {
  const UListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Brand Logo
            UShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: USizes.spaceBtwItems,),
            Column(
              children: [
                /// Brand Name
                UShimmerEffect(width: 100, height: 15),
                SizedBox(height: USizes.spaceBtwItems / 2,),
                /// Brand products
                UShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
