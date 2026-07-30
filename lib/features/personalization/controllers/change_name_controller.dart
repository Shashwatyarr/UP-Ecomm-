import 'package:ecomm/features/personalization/controllers/user_controller.dart';
import 'package:ecomm/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/user/user_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/snackbar_helpers.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();
  final _userController = UserController.instance;
  final _userRepository = UserRepository.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  void initializeNames() {
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      UFullScreenLoader.openLoadingDialog(
          'We are updating your information...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      _userRepository.updateSingleField(
          {'firstName': firstName.text, 'lastName': lastName.text});

      _userController.user.value.firstName=firstName.text;
      _userController.user.value.lastName=lastName.text;
      UFullScreenLoader.stopLoading();
      Get.offAll(()=>NavigationMenu());
      USnackBarHelpers.successSnackBar(title: 'Congratulations', message: 'Name updated successfully');
    }
    catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
          title: 'Update Name Failed', message: e.toString());
    }
  }
}