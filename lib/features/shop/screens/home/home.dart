import 'package:ecomm/features/shop/controllers/home/home_controller.dart';
import 'package:ecomm/features/shop/screens/all_products/all_products.dart';
import 'package:ecomm/features/shop/screens/home/widgets/Promo_slider.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecomm/common/custom_shapes/primary_header_container.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product/product_controller.dart';
import '../../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final productController=Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UHomeAppBar(),
                        SizedBox(height: USizes.spaceBtwSections),
                        UHomeCategories(),
                      ],
                    ),
                  ),
                ),
                USearchBar(),
              ],
            ),
            SizedBox(height: USizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  UPromoSlider(),
                  const SizedBox(height: USizes.spaceBtwSections),
                  USectionHeading(title: 'Popular Products', onPressed: ()=>Get.to(()=>AllProductsScreen(
                    title: 'Popular Products',
                    futureMethod: productController.getAllFeaturedProducts(),
                  ))),
                  SizedBox(height: USizes.spaceBtwItems),
                  Obx(
                    () {
                      if(productController.isLoading.value){
                        return Center(child: CircularProgressIndicator());
                      }
                      if(productController.featuredProducts.isEmpty){
                        return Center(child: Text('No Featured Products'));
                      }
                        return UGridLayout(
                          itemCount: productController.featuredProducts.length,
                          itemBuilder: (context, index) {
                            ProductModel product = productController.featuredProducts[index];
                            return UProductCardVertical(product: product,);
                          },
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
