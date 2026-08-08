import 'dart:convert';

import 'package:ecomm/data/repository/authentication_repository.dart';
import 'package:ecomm/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repository/product/product_repository.dart';
import '../../models/product_model.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find();

  RxMap<String, bool> favourites = <String,bool >{}.obs;
  final _storage=GetStorage(AuthenticationRepository.instance.currentUser!.uid);


  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  Future<void> initFavourites() async {
    String encodedFavourites = _storage.read('favourites');
    Map<String, dynamic> storedFavourites = jsonDecode(encodedFavourites) as Map<String, dynamic>;
    favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
  }

  void toggleFavourite(String productId){
    if(favourites.containsKey(productId)) {
      favourites.remove(productId);
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(message: 'Removed from favourites',);
    }
    else{
      favourites[productId] = true;
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(message: 'Added to favourites',);
    }
  }

  void saveFavouriteToStorage(){
    String encodedFavourites = jsonEncode(favourites);
    _storage.write('favourites', favourites);
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }

  Future<List<ProductModel>> getFavouriteProducts() async{
    final productIds=favourites.keys.toList();
    return await ProductRepository.instance.getFavouriteProducts(productIds);
  }
}