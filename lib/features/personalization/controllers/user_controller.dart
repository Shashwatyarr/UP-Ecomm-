import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:ecomm/features/authentication/models/user_model.dart';
import 'package:ecomm/features/authentication/screens/login/login.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../../utils/constants/apis.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/snackbar_helpers.dart';
import '../screens/edit_profile/widgets/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  //re-auth form variables
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool hidePassword = true.obs;
  RxBool isProfileUploading = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      await fetchUserDetails();
      if(user.value.id.isNotEmpty) return;
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final username = '${userCredential.user!.displayName}234689';
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
      );
      _userRepository.saveUserRecord(userModel);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Data Not Saved',
        message: e.toString(),
      );
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Close Account',
      middleText: 'Are you sure you want to close your account permanently?',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      UFullScreenLoader.openLoadingDialog('Deleting your account...');
      //re-auth
      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;
      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteAccount();
        UFullScreenLoader.stopLoading();
        Get.offAll(() => LoginScreen());
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(()=>ReAuthLoginForm());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Account Deletion Failed',
        message: e.toString(),
      );
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      UFullScreenLoader.openLoadingDialog('Re-authenticating...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      if(!reAuthFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
       return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPasswordUser(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      UFullScreenLoader.stopLoading();
      Get.offAll(()=>LoginScreen());
    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Re-Authentication Failed', message: e.toString());
    }
  }

  Future<void> updateUserProfilePicture() async {
    try {
      isProfileUploading.value=true;
      XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512);
      if (image == null) return;

      UFullScreenLoader.openLoadingDialog('Uploading Profile Picture...');
      File file = File(image.path);
      if(user.value.publicId.isNotEmpty){
        await _userRepository.deleteUserProfilePicture(user.value.publicId);
      }
      dio.Response response = await _userRepository.uploadImage(file);
      if(response.statusCode==200){
        final data=response.data;
        final imageUrl=data['url'];
        final publicId=data['public_id'];
        await _userRepository.updateSingleField({'profilePicture':imageUrl,'publicId':publicId,});
        user.value.profilePicture=imageUrl;
        user.value.publicId=publicId;

        user.refresh();
        USnackBarHelpers.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
      else{
        throw 'Something went wrong. Please try again later';
      }


      UFullScreenLoader.stopLoading();
      USnackBarHelpers.successSnackBar(
          title: 'Congratulations',
          message: 'Your Profile Image has been updated!');
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isProfileUploading.value=false;
    }
  }

}
