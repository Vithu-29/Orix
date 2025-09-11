import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../image_shapes/circular_image.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, this.showBorder = true, this.onTap});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircularImage(
                isNetworkImage: false,
                image: ImageStrings.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? ColorsScheme.white : ColorsScheme.black,
              ),
            ),
            const SizedBox(width: Sizes.xs),

            //Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Nike",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: Sizes.xs),
                      Icon(
                        Iconsax.verify,
                        color: ColorsScheme.primary,
                        size: Sizes.iconXs,
                      ),
                    ],
                  ),
                  Text(
                    "256 products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
