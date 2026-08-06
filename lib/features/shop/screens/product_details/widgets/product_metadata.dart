import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import '../../../../../common/custom_shapes/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/product/product_controller.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    String? salePercentage = controller.caculateSalePercentage(
      product.price,
      product.salePrice,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (salePercentage != null) ...[
              URoundedContainer(
                radius: USizes.sm,
                backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                padding: const EdgeInsets.symmetric(
                  horizontal: USizes.sm,
                  vertical: USizes.xs,
                ),
                child: Text(
                  salePercentage,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: Colors.black),
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
            ],
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0) ...[
              Text(
                '${UTexts.currency}${product.price.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
            ],

            UProductPriceText(price: controller.getProductprice(product), isLarge: true),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        UProductTitleText(title: product.title, smallSize: false),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        Row(
          children: [
            UProductTitleText(title: controller.getProductStockStatus(product.stock), smallSize: true),
            SizedBox(width: USizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        Row(
          children: [
            UCircularImage(
              padding: 0,
              isNetworkImage: true,
              image: product.brand!=null?product.brand!.image:'',
              width: 32.0,
              height: 32.0,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            UBrandTitleWithVerifyIcon(title: product.brand!=null?product.brand!.name:''),
          ],
        ),
      ],
    );
  }
}
