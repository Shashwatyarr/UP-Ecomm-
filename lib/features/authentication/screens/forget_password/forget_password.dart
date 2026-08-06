import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/button/elevated_button.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_controller_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: UPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(UTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
                SizedBox(height: USizes.spaceBtwItems/2,),
                Text(UTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
                SizedBox(height: USizes.spaceBtwSections*2,),
                Column(
                  children: [
                    Form(
                      key: controller.forgetPasswordFormKey,
                      child: TextFormField(
                        controller: controller.email,
                        validator: UValidator.validateEmail,
                        decoration: InputDecoration(
                          labelText: UTexts.email,
                          prefixIcon: Icon(Iconsax.direct_right),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: USizes.spaceBtwItems,),
                UElevatedButton(onPressed: controller.sendPasswordResetEmail, child: Text(UTexts.submit)),
              ],
            )
        ),
      ),
    );
  }
}
