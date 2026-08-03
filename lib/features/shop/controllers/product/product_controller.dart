import 'package:ecomm/utils/constants/enums.dart';
import 'package:ecomm/utils/constants/texts.dart';
import 'package:ecomm/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

import '../../../../data/repository/product/product_repository.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final _repository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFeaturedProducts();
  }

  Future<void> getFeaturedProducts() async {
    try {
      isLoading.value = true;
      List<ProductModel> products = await _repository.fetchfeaturedProducts();
      this.featuredProducts.assignAll(products);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String? caculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) {
      return null;
    }
    if (originalPrice <= 0) return null;
    double salePercentage = (originalPrice - salePrice) / originalPrice * 100;
    return salePercentage.toStringAsFixed(1);
  }
  
  String getProductprice(ProductModel product){
    double smallestPrice=double.infinity;
    double largestPrice=0.0;
    
    if(product.productType==ProductType.single.toString()){
      return product.salePrice>0?product.salePrice.toString():product.price.toString();
    }
    else{
      for(final variation in product.productVariations!){
        final variationPrice=variation.salePrice>0?variation.salePrice:variation.price;
        if(variationPrice<smallestPrice){
          smallestPrice=variation.price;
        }
        if(variationPrice>largestPrice){
          largestPrice=variation.price;
        }
      }
      if(smallestPrice.isEqual(largestPrice)){
        return smallestPrice.toStringAsFixed(0);
      }
      else{
        return '${smallestPrice.toStringAsFixed(0)} -${UTexts.currency}${largestPrice.toStringAsFixed(0)}';
      }
    }
  }
}
