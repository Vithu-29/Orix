import 'package:ecommerce_flutter/features/shop/controllers/products/variation_controller.dart';
import 'package:get/get.dart';
import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
