import 'package:ecomm/features/shop/screens/home/home.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark=UHelperFunctions.isDarkMode(context);

    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(()=> controller.screen[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          backgroundColor: dark?UColors.dark:UColors.light,
          indicatorColor: dark?UColors.light.withValues(alpha: 0.1):UColors.black.withValues(alpha: 0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> screen= [
    HomeScreen(),
    Container(color: Colors.blue,),
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
  ];
}
