import 'package:ecommerce_flutter/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../controllers/products/cart_controller.dart';
import '../../../models/product_model.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.defaultSpace,
        vertical: Sizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? ColorsScheme.darkerGrey : ColorsScheme.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Sizes.cardRadiusLg),
          topLeft: Radius.circular(Sizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus_copy,
                  width: 40,
                  height: 40,
                  backgroundColor: ColorsScheme.darkGrey,
                  color: ColorsScheme.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value < 1
                      ? null
                      : cartController.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: Sizes.spaceBtwItems),
                Text(
                  cartController.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: Sizes.spaceBtwItems),
                CircularIcon(
                  icon: Iconsax.add_copy,
                  width: 40,
                  height: 40,
                  backgroundColor: ColorsScheme.black,
                  color: ColorsScheme.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: cartController.productQuantityInCart.value < 1
                  ? null
                  : () => cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(Sizes.md),
                backgroundColor: ColorsScheme.black,
                side: BorderSide(color: ColorsScheme.black),
              ),
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
