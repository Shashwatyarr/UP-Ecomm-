import "package:flutter/material.dart";
import "my_app.dart";

void main(){
  //widgets flutter binding
  final widgetsBinding= WidgetsFlutterBinding.ensureInitialized();
  //flutter native splash
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
