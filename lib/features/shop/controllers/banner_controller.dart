import 'package:ecommerce_flutter/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //load banner data
  Future<void> fetchBanners() async {
    try {
      //show loader when fetching
      isLoading.value = true;

      // Fetch banners from source
      final banners = await _bannerRepository.getAllBanners();

      //assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }
}
