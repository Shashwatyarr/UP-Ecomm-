import 'package:ecomm/common/custom_shapes/primary_header_container.dart';
import 'package:ecomm/common/widgets/images/circular_image.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/setting_menu_tile.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:ecomm/utils/constants/images.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProfilePrimaryHeader(),
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  UserProfileTile(),
                  SizedBox(height: USizes.spaceBtwItems),

                  USectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),

                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery addresses',
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Logout'),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
