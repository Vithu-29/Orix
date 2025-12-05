import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 56,
    this.width = 56,
    this.padding = 0,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double height, width, padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            backgroundColor ?? (dark ? ColorsScheme.black : ColorsScheme.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      ShimmerEffectLoader(height: 55, width: 55, radius: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(fit: fit, image: AssetImage(image), color: overlayColor),
        ),
      ),
    );
  }
}
