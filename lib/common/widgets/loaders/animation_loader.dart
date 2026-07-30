
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class UAnimationLoader extends StatelessWidget {
  final String text;
  final String animation;
  final bool showActionButton;
  final String? actionText;
  final VoidCallback? onActionPressed;
  
  


  const UAnimationLoader({
    super.key,
    required this.text,
    this.animation = UImages.loadingAnimation,
    this.showActionButton = false,
    this.actionText,
    this.onActionPressed
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Animation
          Lottie.asset(animation, width: Get.width * 0.8),
          const SizedBox(height: USizes.defaultSpace),

          /// Title
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          const SizedBox(height: USizes.defaultSpace),
          
          showActionButton ?
              SizedBox(
                width : 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(backgroundColor: UColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.light),
                    ),
                )
              ) : SizedBox()
        ],
      ),
    );
  }
}
