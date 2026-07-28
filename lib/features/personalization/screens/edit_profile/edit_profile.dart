import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/icon/circular_icon.dart';
import 'package:ecomm/common/widgets/images/user_profile_logo.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/personalization/screens/edit_profile/widgets/user_profile_with_edit_icon.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              UserProfileWithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              USectionHeading(title: 'Account Settings',showActionButton: false,),

              SizedBox(height: USizes.spaceBtwItems),
              UserDetailRow(
                title: 'Name',
                value: 'Shashwat Srivastava',
                onTap: (){},
              ),
              UserDetailRow(
                title: 'UserName',
                value: '1Shashwat Srivastava',
                onTap: (){},
              ),
              SizedBox(height: USizes.spaceBtwSections),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              USectionHeading(title: 'Profile Settings',showActionButton: false,),

              SizedBox(height: USizes.spaceBtwItems),
              UserDetailRow(
                title: 'User Id',
                value: '30892675',
                onTap: (){},
              ),
              UserDetailRow(
                title: 'Email',
                value: 'abs@gmail.com',
                onTap: (){},
              ),
              UserDetailRow(
                title: 'Phone Number',
                value: '97896 37543',
                onTap: (){},
              ),
              UserDetailRow(
                title: 'Gender',
                value: 'Male',
                onTap: (){},
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems,),
              TextButton(onPressed: (){}, child: Text('Close Account',style: TextStyle(color: Colors.red),))
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key, required this.title, required this.value, this.icon=Iconsax.arrow_right_34, required this.onTap,
  });
  final String title , value;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Icon(icon, size: USizes.iconSm),
            ),
          ],
        ),
      ),
    );
  }
}
