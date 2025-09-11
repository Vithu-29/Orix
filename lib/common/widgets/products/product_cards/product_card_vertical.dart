import 'package:ecommerce_flutter/common/styles/shadows.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/image_shapes/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_price_text.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_title_text.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../icons/circular_icon.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: dark ? ColorsScheme.darkerGrey : ColorsScheme.white,
        ),
        child: Column(
          children: [
            //thumbnail
            RoundedContainer(
              height: 180,
              padding: EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? ColorsScheme.dark : ColorsScheme.light,
              child: Stack(
                children: [
                  RoundedImage(
                    imageUrl: ImageStrings.productImage1,
                    applyImageRadius: true,
                  ),

                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: ColorsScheme.secondary.withValues(
                        alpha: 0.8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.sm,
                        vertical: Sizes.xs,
                      ),
                      child: Text(
                        "25%",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: ColorsScheme.black,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(icon: Iconsax.heart, color: Colors.red),
                  ),
                ],
              ),
            ),

            const SizedBox(height: Sizes.spaceBtwItems / 2),

            //details
            Padding(
              padding: EdgeInsets.only(left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: "Green Nike Air Shoes",
                    smallSize: true,
                  ),
                  SizedBox(height: Sizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        "Nike",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: Sizes.xs),
                      Icon(
                        Iconsax.verify,
                        color: ColorsScheme.primary,
                        size: Sizes.iconXs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPriceText(price: "35.0"),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsScheme.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              Sizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: Sizes.iconLg * 1.2,
                          height: Sizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: ColorsScheme.white),
                          ),
                        ),
                      ),
                    ],
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
