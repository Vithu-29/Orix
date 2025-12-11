import 'dart:convert';
import 'package:ecommerce_flutter/data/repositories/products/product_repository.dart';
import 'package:ecommerce_flutter/utils/local_storage/local_storage.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  //method to initialize favourites by reading from storage
  void initFavourites() {
    final json = LocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
        storedFavourites.map((key, value) => MapEntry(key, value as bool)),
      );
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      Loaders.customToast(message: 'Product has been added to the WishList.');
    } else {
      LocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      Loaders.customToast(
        message: 'Product has been removed from the WishList.',
      );
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    LocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    final favouriteIds = favourites.keys.toList();
    if (favouriteIds.isEmpty) return [];
    return await ProductRepository.instance.getFavouriteProducts(favouriteIds);
  }
}
