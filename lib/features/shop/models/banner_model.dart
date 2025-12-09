import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final bool active;
  final String targetScreen;

  BannerModel({
    required this.targetScreen,
    required this.imageUrl,
    required this.active,
  });

  //Empty helper function
  static BannerModel empty() =>
      BannerModel(targetScreen: '', imageUrl: '', active: false);

  //convert model to json format to store in firebase
  Map<String, dynamic> toJson() {
    return {
      'TargetScreen': targetScreen,
      'ImageUrl': imageUrl,
      'Active': active,
    };
  }

  //Map json document snapshot from firebase to banner model
  factory BannerModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return BannerModel(
        targetScreen: data['TargetScreen'] ?? '',
        imageUrl: data['ImageUrl'] ?? '',
        active: data['Active'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}
