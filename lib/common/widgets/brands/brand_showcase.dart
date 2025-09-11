import 'package:ecommerce_flutter/common/widgets/brands/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: ColorsScheme.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(Sizes.md),
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      child: Column(
        children: [
          BrandCard(showBorder: false),
          const SizedBox(height: Sizes.spaceBtwItems,),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: HelperFunctions.isDarkMode(context)
            ? ColorsScheme.darkerGrey
            : ColorsScheme.light,
        margin: const EdgeInsets.only(right: Sizes.sm),
        padding: EdgeInsets.all(Sizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}