import 'package:ecommerce_flutter/common/widgets/image_shapes/circular_image.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/brand_with_verified_button.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_price_text.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/product_title_text.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/products/product_controller.dart';
import '../../../models/product_model.dart';

class ProductMetaData extends StatelessWidget {
  final ProductModel product;
  const ProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
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
                "$salePercentage%",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: ColorsScheme.black),
              ),
            ),
            const SizedBox(width: Sizes.spaceBtwItems),

            //price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: Sizes.spaceBtwItems),
            ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

        //title
        ProductTitleText(title: product.title),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

        //stock
        Row(
          children: [
            ProductTitleText(title: "Status"),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            CircularImage(
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : "",
              width: 32,
              height: 32,
              overlayColor: dark ? ColorsScheme.white : ColorsScheme.black,
            ),
            const SizedBox(width: Sizes.spaceBtwItems / 1.5),
            BrandWithVerifiedButton(
              title: product.brand != null ? product.brand!.name : "",
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
