import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/button/elevated_button.dart';
import 'package:ecomm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecomm/features/shop/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: UPadding.screenPadding,
        child: UCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: UPadding.screenPadding,
        child: UElevatedButton(onPressed: ()=>Get.to(()=>CheckoutScreen()), child: Text('Checkout \$79547')),
      ),
    );
  }
}


