import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecomm/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/sortable_products.dart';
import '../../controllers/product/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key,this.futureMethod, this.query, required this.title});
  final String title;
  final Future<List<ProductModel>>? futureMethod;
  final Query? query;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: FutureBuilder(
            future: futureMethod??controller.fetchProductsByQuery(query),
            builder: (context, asyncSnapshot) {
              final widget=UCloudHelperFunctions.checkMultiRecordState(snapshot: asyncSnapshot,loader: UVerticalProductShimmer());
              if(widget!=null) return widget;
              final products=asyncSnapshot.data!;
              return USortableProducts(products: products,);
            }
          ),
        ),
      ),
    );
  }
}

