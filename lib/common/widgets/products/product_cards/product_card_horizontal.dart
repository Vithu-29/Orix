import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../image_shapes/rounded_image.dart';
import '../../text_widgets/product_price_text.dart';
import '../../text_widgets/product_title_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: dark ? ColorsScheme.darkerGrey : ColorsScheme.softGrey,
        ),
        child: Row(
          children: [
            //thumbnail
            RoundedContainer(
              height: 120,
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

            const SizedBox(width: Sizes.spaceBtwItems / 2),

            //details
            SizedBox(
              width: 182,
              child: Padding(
                padding: const EdgeInsets.only(top: Sizes.sm, left: Sizes.sm),
                child: Column(
                  children: [
                    Column(
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
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: ProductPriceText(price: "35.0")),
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
                              child: Icon(
                                Iconsax.add,
                                color: ColorsScheme.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
