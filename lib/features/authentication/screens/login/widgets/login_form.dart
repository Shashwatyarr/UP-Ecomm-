import 'package:ecomm/features/authentication/controllers/login/login_controller.dart';
import 'package:ecomm/features/authentication/screens/forget_password/forget_password.dart';
import 'package:ecomm/features/authentication/screens/signup/signup.dart';
import 'package:ecomm/navigation_menu.dart';
import 'package:ecomm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.emailController,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: UTexts.email,
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          Obx(
            ()=> TextFormField(
              controller: controller.passwordController,
              validator: (value) => UValidator.validateEmptyText('Password',value),
              obscureText: controller.isPasswordVisible.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UTexts.password,
                suffixIcon: IconButton(onPressed: ()=>controller.isPasswordVisible.toggle(), icon: Icon(!controller.isPasswordVisible.value? Iconsax.eye: Iconsax.eye_slash)),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=>controller.rememberMe.toggle())),
                  Text(UTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: ()=>Get.to(ForgetPasswordScreen()),
                child: Text(UTexts.forgetPassword),
              ),

            ],

          ),

          SizedBox(height: USizes.spaceBtwSections),
          UElevatedButton(onPressed:  controller.loginWithEmailAndPassword, child: Text(UTexts.signIn)),
          SizedBox(height: USizes.spaceBtwSections / 2),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: ()=>Get.to(()=> SignupScreen()),
              child: Text(UTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
