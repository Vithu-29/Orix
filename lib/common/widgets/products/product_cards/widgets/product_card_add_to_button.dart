import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../features/shop/controllers/products/cart_controller.dart';
import '../../../../../features/shop/models/product_model.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {}
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(
          product.id,
        );
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0
                ? ColorsScheme.primary
                : ColorsScheme.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Sizes.cardRadiusMd),
              bottomRight: Radius.circular(Sizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: Sizes.iconLg * 1.2,
            height: Sizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(color: ColorsScheme.white),
                    )
                  : Icon(Iconsax.add, color: ColorsScheme.white),
            ),
          ),
        );
      }),
    );
  }
}
