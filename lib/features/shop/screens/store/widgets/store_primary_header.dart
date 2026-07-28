import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../common/widgets/textfields/search_bar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../home/widgets/primary_header_container.dart';

class UStorePrimaryHeader extends StatelessWidget {
  const UStorePrimaryHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final bool dark=UHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        SizedBox(height: USizes.storePrimaryHeaderHeight + 10),
        UPrimaryHeaderContainer(
          height: USizes.storePrimaryHeaderHeight,
          child: UAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white),
            ),
            actions: [UCartCounterIcon(dark: dark)],
          ),
        ),
        USearchBar(),
      ],
    );
  }
}
