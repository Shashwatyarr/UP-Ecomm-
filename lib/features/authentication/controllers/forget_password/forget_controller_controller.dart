import 'package:ecomm/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repository/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/snackbar_helpers.dart';
import '../../screens/forget_password/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final forgetPasswordFormKey = GlobalKey<FormState>();
  final email = TextEditingController();

  Future<void> sendPasswordResetEmail() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing Your Request...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.successSnackBar(title: 'Password Reset Email Sent');
      Get.to(() => ResetPasswordScreen(email: email.text.trim(),));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Password Reset Failed',
        message: e.toString(),
      );
    }
  }
  Future<void> resendPasswordResetEmail() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing Your Request...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      }

      AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.successSnackBar(title: 'Password Reset Email Sent');
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Password Reset Failed',
        message: e.toString(),
      );
    }
  }
}
