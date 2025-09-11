import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.height,
    this.width,
    this.size = Sizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? height, width, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
            ? ColorsScheme.black.withValues(alpha: 0.9)
            : ColorsScheme.white.withValues(alpha: 0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
