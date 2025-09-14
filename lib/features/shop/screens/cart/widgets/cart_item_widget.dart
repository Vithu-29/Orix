import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_shapes/rounded_image.dart';
import '../../../../../common/widgets/text_widgets/brand_with_verified_button.dart';
import '../../../../../common/widgets/text_widgets/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: ImageStrings.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(Sizes.sm),
          backgroundColor: dark ? ColorsScheme.darkerGrey : ColorsScheme.light,
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BrandWithVerifiedButton(title: "Nike"),
            Flexible(
              child: ProductTitleText(title: "Black Sports Shoe", maxLines: 1),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Color",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: "Green",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "Size",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: "EU 34",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
