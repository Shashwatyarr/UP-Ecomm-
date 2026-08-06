import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecomm/features/shop/models/brand_category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../services/cloudinary_services.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  Future<void> uploadBrand(List<BrandModel> brands) async {
    try {
      for (BrandModel brand in brands) {
        // If image is already a network URL, skip upload to Cloudinary
        if (!brand.image.startsWith('http')) {
          File brandImage = await UHelperFunctions.assetToFile(brand.image);
          dio.Response response = await _cloudinaryServices.uploadImage(
            brandImage,
            UKeys.brandFolder,
          );
          if (response.statusCode == 200) {
            brand.image = response.data['url'];
          }
        }

        await _db
            .collection(UKeys.brandsCollection)
            .doc(brand.id)
            .set(brand.toJson());
        print('Uploaded brand: ${brand.name}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error uploading brand: $e';
    }
  }

  Future<List<BrandModel>> fetchBrand() async {
    try {
      final query=await _db.collection(UKeys.brandsCollection).get();
      if(query.docs.isNotEmpty){
        List<BrandModel> brands = query.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
        return brands;
      }
        return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching brands: $e';
    }
  }

  Future<List<BrandModel>> fetchBrandsForCategory(String categoryId) async {
    try {
      final brandCategoryQuery = await _db.collection(UKeys.brandCategoryCollection).where('CategoryId', isEqualTo: categoryId).get();

      List<BrandCategoryModel> brandCategories = brandCategoryQuery.docs.map((doc) => BrandCategoryModel.fromSnapshot(doc)).toList();

      List<String> brandIds = brandCategories.map((category) => category.brandId).toList();

      if (brandIds.isEmpty) return [];

      final brandsQuery = await _db.collection(UKeys.brandsCollection).where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      final brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching brands for category: $e';
    }
  }
}
