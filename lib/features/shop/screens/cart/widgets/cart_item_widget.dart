import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_shapes/rounded_image.dart';
import '../../../../../common/widgets/text_widgets/brand_with_verified_button.dart';
import '../../../../../common/widgets/text_widgets/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(Sizes.sm),
          backgroundColor: dark ? ColorsScheme.darkerGrey : ColorsScheme.light,
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandWithVerifiedButton(title: cartItem.brandName ?? ''),
              Flexible(
                child: ProductTitleText(title: cartItem.title, maxLines: 1),
              ),

              //attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                              text: '${e.key} ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: '${e.value}  ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
