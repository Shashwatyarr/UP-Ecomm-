import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/button/social_buttons.dart';
import 'package:ecomm/common/widgets/login_signup/form_divider.dart';
import 'package:ecomm/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              USignupForm(),
              SizedBox(height: USizes.spaceBtwSections,),
              UFormDivider(title: UTexts.orSignupWith,),
              SizedBox(height: USizes.spaceBtwSections,),
              USocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

