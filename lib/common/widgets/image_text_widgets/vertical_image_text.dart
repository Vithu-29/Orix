import 'package:ecommerce_flutter/common/widgets/image_shapes/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = ColorsScheme.white,
    this.isNetworkImage = true,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircularImage(
            image: image,
            fit: BoxFit.fitWidth,
            padding: Sizes.sm * 1.4,
            isNetworkImage: isNetworkImage,
            backgroundColor: backgroundColor,
            overlayColor: dark ? ColorsScheme.light : ColorsScheme.dark,
          ),
          //Text
          const SizedBox(height: Sizes.spaceBtwItems / 2),
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: ColorsScheme.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
