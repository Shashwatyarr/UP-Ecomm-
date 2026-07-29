import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/brands/brand_cart.dart';
import 'package:ecomm/features/shop/screens/all_products/all_products.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable_products.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Bata', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,
        child: Column(
          children: [
            UBrandCard(),
            SizedBox(height: USizes.spaceBtwSections,),
            USortableProducts(),
          ],
        ),
        ),
      ),
    );
  }
}
