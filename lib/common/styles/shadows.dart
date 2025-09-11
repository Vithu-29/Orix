import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShadowStyle {
  
  static final verticalProductShadow = BoxShadow(
    color: ColorsScheme.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: ColorsScheme.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}