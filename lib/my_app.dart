import 'package:ecomm/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecomm/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UAppTheme.lightTheme,
      darkTheme:UAppTheme.darkTheme,
      home: OnboardingScreen(),
    );
  }
}
