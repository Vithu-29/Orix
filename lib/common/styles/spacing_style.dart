import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight,
    bottom: Sizes.defaultSpace,
    left: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
  );
}