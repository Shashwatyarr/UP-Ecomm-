import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/button/elevated_button.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_atributes.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/enums.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProductThumbnailAndSlider(product: product),
            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  UProductMetaData(product: product),
                  if (product.productType ==
                      ProductType.variable.toString()) ...[
                    UProductAttributes(product: product,),
                    SizedBox(height: USizes.spaceBtwSections),
                  ],

                  UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                  SizedBox(height: USizes.spaceBtwSections),
                  USectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: UBottomAddToCart(),
    );
  }
}
