import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/icon/circular_icon.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/loaders/animation_loader.dart';
import 'package:ecomm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecomm/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecomm/features/shop/controllers/product/favourite_controller.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/navigation_menu.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          UCircularIcon(
            icon: Iconsax.add,
            onPressed: () =>
                NavigationController.instance.selectedIndex.value = 0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Obx(
              ()=> FutureBuilder(
              future: FavouriteController.instance.getFavouriteProducts(),
              builder: (context, asyncSnapshot) {
                final nothingFound=UAnimationLoader(text: 'Wishlist is empty',showActionButton: true, actionText: "Let's add some", onActionPressed: ()=>NavigationController.instance.selectedIndex.value=0,);
                const loader=UVerticalProductShimmer(itemCount: 6,);
                final widget=UCloudHelperFunctions.checkMultiRecordState(snapshot: asyncSnapshot,loader: loader,nothingFound: nothingFound);
                if(widget!=null) return widget;
                List<ProductModel> products=asyncSnapshot.data!;
                return UGridLayout(
                  itemCount: products.length,
                  itemBuilder: (context, index) => UProductCardVertical(product: products[index],),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
