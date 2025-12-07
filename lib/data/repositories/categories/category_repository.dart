import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw DefinedFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw DefinedPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Get sub categories
  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      return List.empty();
    } on FirebaseException catch (e) {
      throw DefinedFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw DefinedPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
