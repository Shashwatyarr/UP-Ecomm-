import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);

    selectedProductImage.value = product.thumbnail;
    if (product.images != null || product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      List<String> variationImages = product.productVariations!
          .map((variation) => variation.image)
          .toList();
      images.addAll(variationImages);
    }
    return images.toList();
  }

  void setSelectedProductImage(String imageUrl) {
    selectedProductImage.value = imageUrl;
  }

  void showEnlargeImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: USizes.defaultSpace * 2,
                horizontal: USizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: Get.back, child: Text('Close')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
