import 'package:ecomm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart' show USizes;
import '../layouts/grid_layout.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) {},
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        SizedBox(height: USizes.spaceBtwSections,),
        UGridLayout(itemCount: 10, itemBuilder:(context, index) => UProductCardVertical(product: ProductModel.empty(),),)
      ],
    );
  }
}
