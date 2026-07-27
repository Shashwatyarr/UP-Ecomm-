import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    bool dark=UHelperFunctions.isDarkMode(context);
    return UAppBar(
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(UTexts.homeAppBarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.grey),),
            Text(UTexts.homeAppBarSubTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.white),),
          ]
      ),
      actions: [
        UCartCounterIcon(dark: dark)
      ],
    );
  }
}
