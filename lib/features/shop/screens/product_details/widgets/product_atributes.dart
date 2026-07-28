import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        URoundedContainer(
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  USectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  SizedBox(width: USizes.spaceBtwItems),
                  Column(
                    children: [
                      Row(
                        children: [
                          UProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          Text(
                            '250',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          SizedBox(width: USizes.spaceBtwItems),
                          UProductPriceText(price: '200'),
                        ],
                      ),
                      Row(
                        children: [
                          UProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              UProductTitleText(
                title: 'This is a product of Iphone 11 with 512GB',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: USizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                  text: 'Black',
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Orange',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: 'Sizes', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                  text: 'Small',
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Medium',
                  selected: false,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Large',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
