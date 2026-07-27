import 'package:ecomm/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:ecomm/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/device_helpers.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(onBoardingController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnBoardingPage(animation: UImages.onboarding1Animation,title: UTexts.onBoardingTitle1,subtitle: UTexts.onBoardingSubTitle1,),
                OnBoardingPage(animation: UImages.onboarding2Animation,title: UTexts.onBoardingTitle2,subtitle: UTexts.onBoardingSubTitle2,),
                OnBoardingPage(animation: UImages.onboarding3Animation,title: UTexts.onBoardingTitle3,subtitle: UTexts.onBoardingSubTitle3,),
              ],
            ),
            OnboardingDotNavigation(),
            OnBoardingNextButton(),
            OnboardingSkipButton()
          ],
        ),
      ),
    );
  }
}

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingController.instance;
    return Obx(()=> controller.currentIndex.value==2?SizedBox(): Positioned(
        top: UDeviceHelper.getAppBarHeight(),
          right: 0,
          child: TextButton(onPressed: controller.skipPage, child: Text('skip'))),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingController.instance;
    return Positioned(
      left: 0,
      right: 0,
      bottom: USizes.spaceBtwItems*4,
      child: UElevatedButton(
        child: Obx(()=> Text(controller.currentIndex.value==2? 'Get Started' : 'Next')),
        onPressed: controller.nextPage,
      ),
    );
  }
}



class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= onBoardingController.instance;
    return Positioned(
      bottom: UDeviceHelper.getBottomNavigationBarHeight()*4,
        left: UDeviceHelper.getScreenWidth(context)/3,
        right: UDeviceHelper.getScreenWidth(context)/3,
        child: SmoothPageIndicator(controller: controller.pageController,onDotClicked: controller.dotNavigationClick,count: 3, effect: ExpandingDotsEffect(
          dotHeight: 6.0,
        ),));
  }
}


