import 'package:ecomm/routes/app_routes.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UAppTheme.lightTheme,
      darkTheme:UAppTheme.darkTheme,
      initialBinding: UBindings(),
      getPages: UAppRoutes.screens,
      home: Scaffold(
        backgroundColor: UColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: UColors.white,),
        ),
      ),
    );
  }
}
