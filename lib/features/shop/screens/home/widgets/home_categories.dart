import 'package:ecomm/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecomm/features/shop/models/category_model.dart';
import 'package:ecomm/features/shop/screens/subcategory/subcategory.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/category/category_controller.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),
          Obx(() {
            final categories = controller.featuredCategories;
            if(controller.isCategoryLoading.value){
              return UCategoryShimmer();
            }
            if(categories.isEmpty){
              return Text('No categories found');
            }
            return SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return UVerticalImageText(
                    title: category.name,
                    image: category.image,
                    textColor: UColors.white,
                    onTap: () => Get.to(() => SubcategoryScreen()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
