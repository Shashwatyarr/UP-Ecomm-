import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/brands/brand_cart.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/models/brand_model.dart';
import 'package:ecomm/features/shop/screens/brands/brand_products.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmer/brands_shimmer.dart';
import '../../controllers/brand/brand_controller.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
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
              USectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),
              Obx(() {
                if (controller.isLoading.value) {
                  return UBrandsShimmer();
                }
                if (controller.allBrands.isEmpty) {
                  return Center(child: Text('No Brands Found'));
                }
                return UGridLayout(
                  itemCount: controller.allBrands.length,
                  itemBuilder: (context, index) {
                    final brand = controller.allBrands[index];
                    return UBrandCard(
                      brand: brand,
                      onTap: () => Get.to(() => BrandProductsScreen()),
                    );
                  },
                  mainAxisExtent: 80,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
