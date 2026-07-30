import 'package:ecomm/features/personalization/screens/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/user_controller.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Obx(()=> Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall,)),
      subtitle: Obx(()=>Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium)),
      trailing: IconButton(onPressed: ()=>Get.to(()=>EditProfileScreen()), icon: Icon(Iconsax.edit)),
    );
  }
}
