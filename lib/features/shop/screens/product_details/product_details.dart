import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/button/elevated_button.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_atributes.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProductThumbnailAndSlider(),
            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  UProductMetaData(),
                  UProductAttributes(),
                  SizedBox(height: USizes.spaceBtwSections),
                  UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                  SizedBox(height: USizes.spaceBtwSections),
                  USectionHeading(title: 'Description', showActionButton: false),
                  SizedBox(height: USizes.spaceBtwItems),
                  ReadMoreText(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: UBottomAddToCart(),
    );
  }
}
