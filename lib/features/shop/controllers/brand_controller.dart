import 'package:ecommerce_flutter/data/repositories/products/product_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/brand_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/brand/brand_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  //load brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //get brands for category

  //get brand specific products
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(
        brandId: brandId,
      );
      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}
