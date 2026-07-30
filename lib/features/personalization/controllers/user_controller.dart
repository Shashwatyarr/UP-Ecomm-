import 'package:ecomm/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repository/user/user_repository.dart';
import '../../../utils/popups/snackbar_helpers.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final _userRepository=Get.put(UserRepository());
  Rx<UserModel> user=UserModel.empty().obs;
  RxBool profileLoading=false.obs;
  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final username = '${userCredential.user!.displayName}234689';
      UserModel userModel = UserModel(id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email??'',
          phoneNumber: userCredential.user!.phoneNumber??'',
          profilePicture: userCredential.user!.photoURL??'',
      );
      _userRepository.saveUserRecord(userModel);
    }
    catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Data Not Saved', message: e.toString());
    }
  }
  Future<void> fetchUserDetails() async{

    try{
      profileLoading.value=true;
      UserModel user=await _userRepository.fetchUserDetails();
      this.user(user);
    }
    catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value=false;
    }
  }
}