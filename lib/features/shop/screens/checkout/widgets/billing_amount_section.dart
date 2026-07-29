import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text('\$343',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text('\$3',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text('\$3',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text('\$3430',style: Theme.of(context).textTheme.titleMedium,),
          ],
        )
      ],
    );
  }
}
