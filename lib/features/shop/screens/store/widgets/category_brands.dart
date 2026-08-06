import 'package:ecomm/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecomm/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecomm/features/shop/controllers/brand/brand_controller.dart';
import 'package:ecomm/features/shop/models/category_model.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/texts/brand_showcase.dart';
import '../../../../../utils/constants/images.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, asyncSnapshot) {
        const loader=Column(
          children: [
            UListTileShimmer(),
            SizedBox(height: USizes.spaceBtwItems,),
            UBoxesShimmer(),
            SizedBox(height: USizes.spaceBtwItems,),
          ],
        );
        final widget=UCloudHelperFunctions.checkMultiRecordState(snapshot: asyncSnapshot,loader: loader);
        if(widget!=null){
          return widget;
        }
        final brands = asyncSnapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id,limit: 3),
                builder: (context, snapshot) {
                  final widget= UCloudHelperFunctions.checkMultiRecordState(snapshot: asyncSnapshot);
                  if(widget!=null){
                    return widget;
                  }
                  final products = snapshot.data!;
                  return UBrandShowcase(
                      brand: brand,
                      images: products.map((product) => product.thumbnail).toList(),
                  );
                },
            );
          },
        );
      },
    );
  }
}
