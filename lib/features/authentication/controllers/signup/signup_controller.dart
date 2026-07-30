import 'package:ecomm/data/repository/authentication_repository.dart';
import 'package:ecomm/features/authentication/models/user_model.dart';
import 'package:ecomm/features/authentication/screens/signup/verify_email.dart';
import 'package:ecomm/utils/helpers/network_manager.dart';
import 'package:ecomm/utils/popups/full_screen_loader.dart';
import 'package:ecomm/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repository/user/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  RxBool privacyPolicy = false.obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Future<void> registerUser() async {
    try {
      UFullScreenLoader.openLoadingDialog('We are processing your information');
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }
      if (!signUpFormKey.currentState!.validate()) return;
      UserCredential userCredential = await AuthenticationRepository.instance.registerUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        username:
            firstNameController.text.trim() +
            lastNameController.text.trim() +
            '3084567',
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);

      USnackBarHelpers.successSnackBar(title: 'Congratulations',message: 'Your account has been created! Verify Email to continue');
      UFullScreenLoader.stopLoading();
      Get.to(() =>VerifyEmailScreen(email: emailController.text.trim(),));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error',message: e.toString());
    }
  }
}
