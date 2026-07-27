import 'package:ecomm/common/custom_shapes/circular_container.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecomm/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/textfields/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
          UPrimaryHeaderContainer(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UHomeAppBar(),
                  SizedBox(height: USizes.spaceBtwSections),
                  UHomeCategories(),
                ],
              ),
            ),
          ),
          USearchBar(),
        ],
      ),
    );
  }
}

