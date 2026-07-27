import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../../../utils/helpers/helper_functions.dart';

class UAppBar extends StatelessWidget implements PreferredSizeWidget{
  const UAppBar({super.key, this.title,  this.showBackArrow=false, this.leadingIcon, this.actions, this.leadingOnPressed});
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow? IconButton(onPressed: ()=>Get.back, icon: Icon(Iconsax.arrow_left,color: dark?UColors.white:UColors.dark,)):leadingIcon!=null? IconButton(onPressed: (){}, icon: Icon(leadingIcon)):null,
        title: title,
        actions:
        actions
        ,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight());
}
