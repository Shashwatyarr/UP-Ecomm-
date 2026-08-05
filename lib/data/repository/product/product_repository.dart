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
      int count = 1;
      for (ProductModel product in products) {
        print(
          'Uploading Product $count of ${products.length}: ${product.title}...',
        );
        final Map<String, String> uploadedImageMap = {};

        // --- Handle Thumbnail ---
        if (product.thumbnail.startsWith('http')) {
          uploadedImageMap[product.thumbnail] = product.thumbnail;
        } else {
          try {
            File thumbnailFile = await UHelperFunctions.assetToFile(
              product.thumbnail,
            );
            dio.Response response = await _cloudinaryServices.uploadImage(
              thumbnailFile,
              UKeys.productFolder,
            );
            if (response.statusCode == 200) {
              String url = response.data['url'];
              uploadedImageMap[product.thumbnail] = url;
              product.thumbnail = url;
            }
          } catch (e) {
            print('Error uploading thumbnail for ${product.title}: $e');
          }
        }

        // --- Handle Product Images ---
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> updatedImageUrls = [];

          for (String image in product.images!) {
            if (image.startsWith('http')) {
              uploadedImageMap[image] = image;
              updatedImageUrls.add(image);
            } else {
              try {
                File imageFile = await UHelperFunctions.assetToFile(image);
                dio.Response response = await _cloudinaryServices.uploadImage(
                  imageFile,
                  UKeys.productFolder,
                );
                if (response.statusCode == 200) {
                  String url = response.data['url'];
                  uploadedImageMap[image] = url;
                  updatedImageUrls.add(url);
                } else {
                  updatedImageUrls.add(
                    image,
                  ); // Fallback to asset path to keep list aligned
                }
              } catch (e) {
                print('Error uploading image $image: $e');
                updatedImageUrls.add(image);
              }
            }
          }

          // --- Update Variations ---
          if (product.productVariations != null &&
              product.productVariations!.isNotEmpty) {
            for (final variation in product.productVariations!) {
              if (variation.image.isNotEmpty) {
                final match = uploadedImageMap[variation.image];
                if (match != null) {
                  variation.image = match;
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

        print('SUCCESS: Product ${product.title} uploaded.');
        count++;
      }
      print('ALL PRODUCTS UPLOADED SUCCESSFULLY');
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error during product upload: $e';
    }
  }

  Future<List<ProductModel>> fetchfeaturedProducts() async {
    try {
      final query = await _db
          .collection(UKeys.productsCollection)
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final query = await _db
          .collection(UKeys.productsCollection)
          .where('IsFeatured', isEqualTo: true)
          .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final queryS = await query.get();

      if (queryS.docs.isNotEmpty) {
        List<ProductModel> products = queryS.docs
            .map((document) => ProductModel.fromQuerySnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final query = limit == -1
          ? await _db
                .collection(UKeys.productsCollection)
                .where('Brand.Id', isEqualTo: brandId)
                .get()
          : await _db
                .collection(UKeys.productsCollection)
                .where('Brand.Id', isEqualTo: brandId)
                .limit(limit)
                .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((document) => ProductModel.fromSnapshot(document))
            .toList();
        return products;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }
}
