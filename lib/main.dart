import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "my_app.dart";

void main(){
  //widgets flutter binding
  final widgetsBinding= WidgetsFlutterBinding.ensureInitialized();
  //flutter native splash
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
