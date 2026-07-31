import "package:ecomm/data/repository/authentication_repository.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "firebase_options.dart";
import "my_app.dart";

Future<void> main() async{
  //widgets flutter binding
  final widgetsBinding= WidgetsFlutterBinding.ensureInitialized();

  //init local storage
  await GetStorage.init();

  //flutter native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value){
    Get.put(AuthenticationRepository());
  });

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
