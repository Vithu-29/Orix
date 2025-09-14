import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_price_text.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_title_text.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RoundedContainer(
          padding: EdgeInsets.all(Sizes.md),
          backgroundColor: dark ? ColorsScheme.darkerGrey : ColorsScheme.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SectionHeading(title: "Variation", showTextButton: false),
                  const SizedBox(width: Sizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Price",
                            smallSize: true,
                          ),
                          Text(
                            "\$25",
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: Sizes.spaceBtwItems),
                          ProductPriceText(price: "20"),
                        ],
                      ),

                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              //variation description
              ProductTitleText(
                title: "This is the description of the product and this can go up to maximum 4 lines ",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        const SizedBox(height: Sizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: "Colors",showTextButton: false,),
            SizedBox(height: Sizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ProductChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                ProductChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                ProductChoiceChip(
                  text: 'Blue',
                  selected: true,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: "Size",showTextButton: false,),
            SizedBox(height: Sizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ProductChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                ProductChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                ProductChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
