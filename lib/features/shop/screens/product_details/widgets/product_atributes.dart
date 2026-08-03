import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../controllers/product/variation_controller.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    controller.resetSelectedAttributes();

    return Obx(
      () => Column(
        children: [
          // Selected Variation Price & Description
          if (controller.selectedVariation.value.id.isNotEmpty)
            URoundedContainer(
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const USectionHeading(title: 'Variation', showActionButton: false),
                      const SizedBox(width: USizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const UProductTitleText(title: 'Price : ', smallSize: true),
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              if (controller.selectedVariation.value.salePrice > 0) const SizedBox(width: USizes.spaceBtwItems),
                              UProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const UProductTitleText(title: 'Stock : ', smallSize: true),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  UProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(height: USizes.spaceBtwItems),

          // Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  USectionHeading(
                    title: attribute.name ?? '',
                    showActionButton: false,
                  ),
                  const SizedBox(height: USizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: USizes.sm,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      final available = controller
                          .getAttributesAvailiabilityInVariation(product.productVariations!, attribute.name!)
                          .contains(attributeValue);

                      return UChoiceChip(
                        text: attributeValue,
                        selected: isSelected,
                        onSelected: available
                            ? (selected) {
                                if (selected) {
                                  controller.onAttributeSelected(product, attribute.name, attributeValue);
                                }
                              }
                            : null,
                      );
                    }).toList(),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
