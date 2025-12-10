import 'package:ecommerce_flutter/common/styles/shadows.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/image_shapes/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_price_text.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_title_text.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../features/shop/controllers/product_controller.dart';
import '../../../../utils/constants/enums.dart';
import '../../icons/circular_icon.dart';

class ProductCardVertical extends StatelessWidget {
  final ProductModel product;
  const ProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
              width: 180,
              padding: EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? ColorsScheme.dark : ColorsScheme.light,
              child: Stack(
                children: [
                  Center(
                    child: RoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
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
                        "$salePercentage%",
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
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(title: product.title, smallSize: true),
                    SizedBox(height: Sizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        Text(
                          product.brand!.name,
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
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: Sizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: Sizes.sm),
                        child: ProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsScheme.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.cardRadiusMd),
                      bottomRight: Radius.circular(Sizes.productImageRadius),
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
    );
  }
}
