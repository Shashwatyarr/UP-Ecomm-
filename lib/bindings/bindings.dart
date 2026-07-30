import 'package:ecomm/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class UBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}