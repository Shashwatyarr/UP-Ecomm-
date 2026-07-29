import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(
          title: 'Billing Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Shashwat',
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.phone, size: USizes.iconSm, color: UColors.darkGrey),
            SizedBox(width: USizes.spaceBtwItems),
            Text(
              '+91 9798632722',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(
              Icons.location_history,
              size: USizes.iconSm,
              color: UColors.darkGrey,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(
              child: Text('House no.93, Rikabganj Ayodhya', softWrap: true),
            ),
          ],
        ),
      ],
    );
  }
}
