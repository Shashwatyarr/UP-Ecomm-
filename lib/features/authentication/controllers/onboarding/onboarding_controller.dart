import 'package:ecomm/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class onBoardingController extends GetxController{
  static onBoardingController get instance =>Get.find();
  final storage=GetStorage();
  final pageController= PageController();
  RxInt currentIndex=0.obs;

  void updatePageIndicator(index){
    currentIndex.value=index;

  }

  void dotNavigationClick(index){
    currentIndex.value=index;
    pageController.jumpToPage(index);
  }

  void nextPage(){
    if(currentIndex.value==2) {
      storage.write('isFirstTime', false);
      Get.offAll(()=>LoginScreen());
      return;
    }
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);
  }

  void skipPage(){
    currentIndex.value=2;
    pageController.jumpToPage(currentIndex.value);
  }
}