import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecomm/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

import '../../../../data/repository/banner/banner_repository.dart';
import '../../models/banner_model.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();
  final _repository=Get.put(BannerRepository());
  RxList<BannerModel> banners=<BannerModel>[].obs;
  RxBool isLoading=false.obs;
  final carouselController= CarouselSliderController();
  RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchBanners();//
  }

  void onPageChnaged(int index){
    currentIndex.value=index;
  }

  Future<void> fetchBanners() async {
    try{
      isLoading(true);
      List<BannerModel> activeBanners=await _repository.fetchActiveBanner();
      banners.assignAll(activeBanners);
    }
    catch(e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }finally{
      isLoading(false);
    }
  }

}