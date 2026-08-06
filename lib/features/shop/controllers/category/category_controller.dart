import 'package:ecomm/data/repository/product/product_repository.dart';
import 'package:ecomm/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

import '../../../../data/repository/category/category_repository.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _repository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isCategoryLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async{
    try{
      isCategoryLoading.value=true;
      List<CategoryModel> categories=await _repository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(categories.where((element) => element.isFeatured&&element.parentId.isEmpty));
    }
    catch(e){
      USnackBarHelpers.errorSnackBar(title: 'failed',message: e.toString());
    }finally{
      isCategoryLoading.value=false;
    }
  }

  Future<List<ProductModel>> getCategoryProducts({required String categoryId,int limit=4}) async{
    try{
      final products= ProductRepository.instance.getProductsForCategory(categoryId: categoryId,limit: limit);
      return products;
    }catch(e){
      USnackBarHelpers.errorSnackBar(title: 'failed',message: e.toString());
      return [];
    }
  }
}