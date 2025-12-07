import 'package:ecommerce_flutter/data/repositories/categories/category_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategories() async {
    try {
      //show loader when fetching
      isLoading.value = true;

      // Fetch categories from source
      final categories = await _categoryRepository.getAllCategories();

      // Update the category list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }

  //load selected category data

  //Get category or sub category products
}
