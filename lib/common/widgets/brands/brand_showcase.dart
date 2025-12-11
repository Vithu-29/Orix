import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:ecommerce_flutter/features/shop/screens/all_brands/brand_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images, required this.brand});

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: ColorsScheme.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(Sizes.md),
        margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
        child: Column(
          children: [
            BrandCard(showBorder: false, brand: brand),
            const SizedBox(height: Sizes.spaceBtwItems),
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
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
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ShimmerEffectLoader(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
