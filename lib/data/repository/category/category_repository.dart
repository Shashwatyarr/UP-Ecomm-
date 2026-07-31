import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../services/cloudinary_services.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variable
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      // Connectivity Check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        print('Warning: Skipping category upload due to no internet connection.');
        return;
      }

      for (final category in categories) {
        File file=await UHelperFunctions.assetToFile(category.image);
        dio.Response response = await _cloudinaryServices.uploadImage(file, UKeys.categoryFolder);
        if(response.statusCode==200){
          category.image=response.data['url'];
        }
        await _db
            .collection(UKeys.categoryCollection)
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error uploading categories: $e';
    }
  }


  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final query=await _db.collection(UKeys.categoryCollection).get();
      if(query.docs.isNotEmpty){
        List<CategoryModel> categories=query.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
        return categories;
      }
      return [];

    }on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error uploading categories: $e';
    }
  }
}
