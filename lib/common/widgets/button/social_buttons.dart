import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
//import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';



class USocialButtons extends StatelessWidget {
  const USocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google Button
        buildButton(UImages.googleIcon,(){}),
        SizedBox(width: USizes.spaceBtwItems),

        /// Facebook Button
        buildButton(UImages.facebookIcon, (){}),
      ],
    );
  }

  Container buildButton(String image, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: UColors.grey),
          borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(onPressed: onPressed, icon: Image.asset(image, height: USizes.iconMd, width: USizes.iconMd,)),
    );
  }
}