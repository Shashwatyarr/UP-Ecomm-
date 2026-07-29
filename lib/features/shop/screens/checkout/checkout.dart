import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/screens/success_screen.dart';
import 'package:ecomm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecomm/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecomm/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecomm/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecomm/navigation_menu.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/textfields/promo_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              UCartItems(showAddRemoveButtons: false),
              SizedBox(height: USizes.spaceBtwSections),
              UPromoCodeField(),
              SizedBox(height: USizes.spaceBtwSections),
              URoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems),
                    UBillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),
                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: UPadding.screenPadding,
        child: UElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              title: 'Payment Success',
              subtitle: 'Your Item will be shipped soon',
              image: UImages.successfulPaymentIcon,
              onTap: ()=>Get.offAll(()=>NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$79547'),
        ),
      ),
    );
  }
}
