import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/brands/brand_cart.dart';
import 'package:ecomm/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecomm/features/shop/controllers/brand/brand_controller.dart';
import 'package:ecomm/features/shop/screens/all_products/all_products.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable_products.dart';
import '../../models/brand_model.dart';
import '../../models/product_model.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.title, required this.brand});

  final String title;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,
        child: Column(
          children: [
            UBrandCard(brand: brand,),
            SizedBox(height: USizes.spaceBtwSections,),
            FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id),
              builder: (context, asyncSnapshot) {
                const loader=UVerticalProductShimmer();
                Widget? widget=UCloudHelperFunctions.checkMultiRecordState(snapshot: asyncSnapshot,loader: loader);
                if(widget!=null) return widget;
                List<ProductModel> products=asyncSnapshot.data!;
                return USortableProducts(products: products,);
              }
            ),
          ],
        ),
        ),
      ),
    );
  }
}
