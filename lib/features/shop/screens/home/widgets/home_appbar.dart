import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../personalization/controllers/user_controller.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    bool dark=UHelperFunctions.isDarkMode(context);
    return UAppBar(
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(UHelperFunctions.getGreetingMessage(),style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.grey),),
            Obx((){
              if(controller.profileLoading.value){
                return UShimmerEffect(width: 80, height: 10);
              }
              return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.white),);
            }
            ),
          ]
      ),
      actions: [
        UCartCounterIcon(dark: dark)
      ],
    );
  }
}
