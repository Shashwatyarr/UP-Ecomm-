import 'package:ecomm/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/controllers/category/category_controller.dart';
import 'package:ecomm/features/shop/screens/brands/all_brands.dart';
import 'package:ecomm/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecomm/features/shop/screens/store/widgets/store_primary_header.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_cart.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/brand/brand_controller.dart';
import '../brands/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      UStorePrimaryHeader(),
                      Padding(
                        padding: const EdgeInsets.all(USizes.defaultSpace),
                        child: Column(
                          children: [
                            USectionHeading(
                              title: 'Brands',
                              onPressed: () => Get.to(() => BrandScreen()),
                            ),
                            SizedBox(
                              height: USizes.brandCardHeight,
                              child: Obx(() {
                                if(brandController.isLoading.value){
                                  return UBrandsShimmer();
                                }
                                if(brandController.featuredBrands.isEmpty){
                                  return Center(child: Text('No Brands Found'),);
                                }
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: USizes.spaceBtwItems),
                                  itemCount:
                                      brandController.featuredBrands.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final brand =
                                        brandController.featuredBrands[index];

                                    return SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: UBrandCard(brand: brand,onTap: () => Get.to(() => BrandProductsScreen(title: brand.name,brand: brand,)),),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: controller.featuredCategories
                      .map((e) => Tab(child: Text(e.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: controller.featuredCategories
                .map((category) => UCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
