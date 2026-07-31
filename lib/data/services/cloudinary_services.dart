import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../utils/constants/apis.dart';
import '../../utils/constants/keys.dart';

class CloudinaryServices extends GetxController{
  static CloudinaryServices get instance => Get.find();

  final _dio =dio.Dio();

  Future<dio.Response> uploadImage(File image,String folder) async {
    try {
      String api = UApiUrls.uploadApi(UKeys.cloudName);
      dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': UKeys.uploadPreset,
        'folder': folder,
        'file': await dio.MultipartFile.fromFile(image.path,
            filename: image.path
                .split('/')
                .last),
      });
      dio.Response response = await _dio.post(api, data: formData);
      return response;
    } on dio.DioException catch (e) {
      throw 'Cloudinary upload error: ${e.response?.data['error']['message'] ?? e.message}';
    } catch (e) {
      throw 'Something went wrong while uploading to Cloudinary: $e';
    }
  }

  Future<dio.Response> deleteImage(String publicId) async {
    try {
      String api = UApiUrls.deleteApi(UKeys.cloudName);
      String signatureBase = 'public_id=$publicId&timestamp=${(DateTime
          .now()
          .millisecondsSinceEpoch / 1000).round()}${UKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();
      dio.FormData formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': UKeys.apiKey,
        'timestamp': (DateTime
            .now()
            .millisecondsSinceEpoch / 1000).round(),
        'signature':signature
      });
      dio.Response response = await _dio.post(api, data: formData);
      return response;
    } on dio.DioException catch (e) {
      throw 'Cloudinary delete error: ${e.response?.data['error']['message'] ?? e.message}';
    } catch (e) {
      throw 'Something went wrong while deleting from Cloudinary: $e';
    }
  }
}