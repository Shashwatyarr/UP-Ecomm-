import 'package:flutter/material.dart';

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
    return UCircularImage(
      image: controller.user.value.profilePicture.isNotEmpty?controller.user.value.profilePicture:UImages.profileLogo,
      height: 120,
      width: 120,
      borderWidth: 5.0,
      borderColor: UColors.primary,
      showBorder: true,
      padding: 0,
      isNetworkImage: controller.user.value.profilePicture.isNotEmpty,
    );
  }
}
