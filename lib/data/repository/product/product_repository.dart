import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecomm/utils/constants/keys.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloudinary_services.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  Future<void> uploadProduct(List<ProductModel> products) async {
    try {
      for (ProductModel product in products) {
        // --- Handle Thumbnail ---
        // If it's already a URL, keep it. Otherwise, upload.
        if (!product.thumbnail.startsWith('http')) {
          File thumbnailFile = await UHelperFunctions.assetToFile(
            product.thumbnail,
          );
          dio.Response response = await _cloudinaryServices.uploadImage(
            thumbnailFile,
            UKeys.productFolder,
          );
          if (response.statusCode == 200) {
            product.thumbnail = response.data['url'];
          }
        }

        // --- Handle Product Images ---
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> updatedImageUrls = [];

          for (String image in product.images!) {
            if (image.startsWith('http')) {
              updatedImageUrls.add(image);
            } else {
              File imageFile = await UHelperFunctions.assetToFile(image);
              dio.Response response = await _cloudinaryServices.uploadImage(
                imageFile,
                UKeys.productFolder,
              );
              if (response.statusCode == 200) {
                updatedImageUrls.add(response.data['url']);
              }
            }
          }

          // --- Update Variations ---
          // Map variation images only if we have new URLs and variations exist
          if (product.productVariations != null &&
              product.productVariations!.isNotEmpty) {
            for (final variation in product.productVariations!) {
              // Only update if variation image is an asset path (not a URL)
              if (variation.image.isNotEmpty &&
                  !variation.image.startsWith('http')) {
                int index = product.images!.indexWhere(
                  (element) => element == variation.image,
                );
                if (index != -1 && index < updatedImageUrls.length) {
                  variation.image = updatedImageUrls[index];
                }
              }
            }
          }

          // Update the main images list
          product.images = updatedImageUrls;
        }

        // --- Save to Firestore ---
        await _db
            .collection(UKeys.productsCollection)
            .doc(product.id)
            .set(product.toJson());
        print('Product ${product.title} uploaded successfully');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error uploading products: $e';
    }
  }

  Future<List<ProductModel>> fetchfeaturedProducts() async {
    try{
      final query =await _db.collection(UKeys.productsCollection).where('IsFeatured',isEqualTo: true).limit(4).get();

      if(query.docs.isNotEmpty){
       List<ProductModel> products=query.docs.map((document)=> ProductModel.fromSnapshot(document)).toList();
       return products;
      }
      return [];
    }on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error uploading products: $e';
    }
  }
}
