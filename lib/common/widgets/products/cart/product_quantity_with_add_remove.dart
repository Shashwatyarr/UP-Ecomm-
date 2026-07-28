import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class UProductQuantityWithAddRemove extends StatelessWidget {
  const UProductQuantityWithAddRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          backgroundColor: dark
              ? UColors.darkerGrey
              : UColors.light,
          color: dark?UColors.white:UColors.black,
        ),
        SizedBox(width: USizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        SizedBox(width: USizes.spaceBtwItems,),
        UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          backgroundColor: UColors.primary,
          color:UColors.white,
        ),
      ],
    );
  }
}
