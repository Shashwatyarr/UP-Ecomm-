import 'package:ecomm/features/shop/controllers/product/product_controller.dart';
import 'package:ecomm/features/shop/models/category_model.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecomm/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/category/category_controller.dart';
import '../../all_products/all_products.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              const SizedBox(height: USizes.spaceBtwItems),
              USectionHeading(title: 'You Might like', onPressed: ()=>Get.to(()=>AllProductsScreen(title: category.name,futureMethod: controller.getCategoryProducts(categoryId: category.id,)))),
              const SizedBox(height: USizes.spaceBtwItems),
              FutureBuilder(
                future: productController.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final response = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const UVerticalProductShimmer(itemCount: 4,),
                  );
                  if (response != null) return response;

                  final products = snapshot.data!;

                  return UGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return UProductCardVertical(product: products[index]);
                    },
                  );
                },
              ),
              const SizedBox(height: USizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
