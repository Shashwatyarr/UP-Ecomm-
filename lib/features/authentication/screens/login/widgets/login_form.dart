import 'package:ecomm/features/authentication/screens/forget_password/forget_password.dart';
import 'package:ecomm/features/authentication/screens/signup/signup.dart';
import 'package:ecomm/navigation_menu.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: UTexts.email,
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: UTexts.password,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
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
        UElevatedButton(onPressed: ()=> Get.to(()=>NavigationMenu()), child: Text(UTexts.signIn)),
        SizedBox(height: USizes.spaceBtwSections / 2),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: ()=>Get.to(()=> SignupScreen()),
            child: Text(UTexts.createAccount),
          ),
        ),
      ],
    );
  }
}
