import 'package:ecomm/features/personalization/controllers/user_controller.dart';
import 'package:ecomm/utils/constants/keys.dart';
import 'package:ecomm/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repository/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/snackbar_helpers.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final _userController=Get.put(UserController());
  final loginFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool rememberMe = false.obs;
  final localStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailController.text = localStorage.read(UKeys.rememberMeEmail) ?? '';
    passwordController.text = localStorage.read(UKeys.rememberMePassword) ?? '';
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      UFullScreenLoader.openLoadingDialog('Logging you in...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      }

      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write(UKeys.rememberMeEmail, emailController.text.trim());
        localStorage.write(UKeys.rememberMePassword, passwordController.text.trim());
      }

      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      UFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try{
      UFullScreenLoader.openLoadingDialog('Loggin you in...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      }
      UserCredential userCredential=await AuthenticationRepository.instance.signInWithGoogle();

      await _userController.saveUserRecord(userCredential);

      UFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    }
    catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }
}
