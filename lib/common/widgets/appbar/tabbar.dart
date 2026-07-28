import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../../../utils/helpers/helper_functions.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? UColors.black : UColors.white,
      child: TabBar(
        tabs: [
          Tab(child: Text('Sports')),
          Tab(child: Text('Furniture')),
          Tab(child: Text('Electronics')),
          Tab(child: Text('Clothes')),
          Tab(child: Text('Cosmetics')),
        ],
        isScrollable: true,
        labelColor: dark?UColors.white:UColors.primary,
        unselectedLabelColor: UColors.dark,
        indicatorColor: UColors.primary,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight());
}
