import 'package:ecomm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class UPrivacyPolicyCheckBox extends StatelessWidget {
  const UPrivacyPolicyCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=SignUpController.instance;
    return Row(
      children: [
        Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=> controller.privacyPolicy.value=!controller.privacyPolicy.value)),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: '${UTexts.iAgreeTo} '),
              TextSpan(
                text: UTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(
                  color: UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: UColors.primary,
                ),
              ),
              TextSpan(text: ' ${UTexts.and} '),
              TextSpan(
                text: UTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(
                  color: UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: UColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
