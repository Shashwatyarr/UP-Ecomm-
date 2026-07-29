import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/brands/brand_cart.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/screens/brands/brand_products.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
              children: [
                USectionHeading(title: 'Brands', showActionButton: false,),
                SizedBox(height: USizes.spaceBtwItems,),
                UGridLayout(itemCount: 10, itemBuilder: (context, index) => UBrandCard(onTap: ()=>Get.to(()=>BrandProductsScreen()),),mainAxisExtent: 80,)
              ]
          ),
        ),
      ),
    );
  }
}
