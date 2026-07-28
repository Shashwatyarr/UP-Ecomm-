import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:ecomm/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/enums.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_cart.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../utils/constants/sizes.dart';
import '../home/widgets/home_appbar.dart' show UHomeAppBar;
import '../home/widgets/home_categories.dart';
import '../home/widgets/primary_header_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              pinned: true,
              floating: true,
              flexibleSpace: Column(
                children: [
                  UStorePrimaryHeader(),
                  Padding(
                    padding: const EdgeInsets.all(USizes.defaultSpace),
                    child: Column(
                      children: [
                        USectionHeading(title: 'Brands',onPressed: (){}),
                        SizedBox(
                          height: USizes.brandCardHeight,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: USizes.spaceBtwItems,
                            ),
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => UBrandCard(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}


