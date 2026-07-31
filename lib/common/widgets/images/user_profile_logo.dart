import 'package:ecomm/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import 'circular_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Obx(
      () {
        if(controller.profileLoading.value){
          return UShimmerEffect(width: 120, height: 120,radius: 120,);
        }
          return UCircularImage(
            image: controller.user.value.profilePicture.isNotEmpty ? controller
                .user.value.profilePicture : UImages.profileLogo,
            height: 120,
            width: 120,
            borderWidth: 5.0,
            borderColor: UColors.primary,
            showBorder: true,
            padding: 0,
            isNetworkImage: controller.user.value.profilePicture.isNotEmpty,
          );
        }
    );
  }
}
