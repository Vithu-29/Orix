import 'package:ecommerce_flutter/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../features/shop/controllers/products/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../image_shapes/rounded_image.dart';
import '../../text_widgets/product_price_text.dart';
import '../../text_widgets/product_title_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({
    super.key,
    required this.product,
    this.isNetworkImage = true,
  });

  final ProductModel product;
  final bool isNetworkImage;

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
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: dark ? ColorsScheme.darkerGrey : ColorsScheme.softGrey,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //thumbnail
            RoundedContainer(
              height: 120,
              padding: EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? ColorsScheme.dark : ColorsScheme.light,
              child: Stack(
                children: [
                  RoundedImage(
                    width: 120,
                    height: 120,
                    imageUrl: product.thumbnail,
                    isNetworkImage: isNetworkImage,
                  ),

                  if (salePercentage != null)
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
                    child: FavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),

            const SizedBox(width: Sizes.spaceBtwItems / 2),

            //details
            Container(
              padding: const EdgeInsets.only(left: Sizes.sm),
              width: 164,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: Sizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitleText(
                          title: product.title,
                          smallSize: true,
                          maxLines: 2,
                        ),
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product.productType ==
                                    ProductType.single.toString() &&
                                product.salePrice > 0)
                              Text(
                                product.price.toString(),
                                style: Theme.of(context).textTheme.labelMedium!
                                    .apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            ProductPriceText(
                              price: controller.getProductPrice(product),
                            ),
                          ],
                        ),
                      ),
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
