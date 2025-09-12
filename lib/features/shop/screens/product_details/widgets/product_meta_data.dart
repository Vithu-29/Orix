import 'package:ecommerce_flutter/common/widgets/image_shapes/circular_image.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/brand_with_verified_button.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_price_text.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_title_text.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //sale tag & price
        Row(
          children: [
            RoundedContainer(
              radius: Sizes.sm,
              backgroundColor: ColorsScheme.secondary.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.sm,
                vertical: Sizes.xs,
              ),
              child: Text(
                "25%",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: ColorsScheme.black),
              ),
            ),
            const SizedBox(width: Sizes.spaceBtwItems),

            //price
            Text(
              "\$250",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            ProductPriceText(price: "175", isLarge: true),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

        //title
        ProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

        //stock
        Row(
          children: [
            ProductTitleText(title: "Status"),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            CircularImage(
              image: ImageStrings.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? ColorsScheme.white : ColorsScheme.black,
            ),
            const SizedBox(width: Sizes.spaceBtwItems / 1.5),
            BrandWithVerifiedButton(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
