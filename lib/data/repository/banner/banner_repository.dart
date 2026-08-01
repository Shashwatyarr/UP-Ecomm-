import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecomm/features/shop/models/banner_model.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloudinary_services.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for (final banner in banners) {
        File image = await UHelperFunctions.assetToFile(banner.imageUrl);
        _cloudinaryServices.uploadImage(image, UKeys.bannerFolder);
        dio.Response response = await _cloudinaryServices.uploadImage(
          image,
          UKeys.bannerFolder,
        );
        if (response.statusCode == 200) {
          banner.imageUrl = response.data['url'];
        }
        await _db.collection(UKeys.bannerCollection).doc().set(banner.toJson());
        print('banner uploaded: ${banner.targetScreen}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<List<BannerModel>> fetchActiveBanner() async {
    try{
      final query=await _db.collection(UKeys.bannerCollection).where('Active',isEqualTo: true).get();
      if(query.docs.isNotEmpty){
        List<BannerModel> banners=query.docs.map((e) => BannerModel.fromDocument(e)).toList();
        return banners;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }

  }
}
