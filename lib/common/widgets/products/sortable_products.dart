import 'package:ecomm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controllers/product/all_products_controller.dart';
import '../../../utils/constants/sizes.dart' show USizes;
import '../layouts/grid_layout.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest']
              .map((filter) {
            return DropdownMenuItem(
              value: filter,
              child: Text(filter),
            );
          })
              .toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value)=>controller.sortProducts(value!),
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        SizedBox(height: USizes.spaceBtwSections,),
        Obx(()=> UGridLayout(itemCount: controller.products.length, itemBuilder:(context, index) => UProductCardVertical(product: controller.products[index],),))
      ],
    );
  }
}
