import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/icon/circular_icon.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Sports', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              USectionHeading(title: 'Sports Shoes', onPressed: () {}),
              SizedBox(height: USizes.spaceBtwItems / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2,),
                  itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>  UProductCardHorizontal(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
