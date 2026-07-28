import 'package:ecomm/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark?UColors.dark:UColors.light,
              shape: BoxShape.circle,

            ),
            child: Center(child: Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(fontSizeFactor: 0.8,color: dark?UColors.light:UColors.dark,),)),
          ),
        ),
        IconButton(onPressed: ()=>Get.to(()=>CartScreen()), icon: const Icon(Iconsax.shopping_bag),color: UColors.light,),
      ],
    );
  }
}
