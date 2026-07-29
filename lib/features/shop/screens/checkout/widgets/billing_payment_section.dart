import 'package:ecomm/common/custom_shapes/rounded_container.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark=UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        USectionHeading(title: 'Payment Method',buttonTitle: 'Change',onPressed: (){},),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            URoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark? UColors.light:UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(image: AssetImage(UImages.googlePay),fit: BoxFit.contain,),
            ),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Text('Google Pay',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
