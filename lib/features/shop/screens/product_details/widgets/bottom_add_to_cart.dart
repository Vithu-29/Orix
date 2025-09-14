import 'package:ecommerce_flutter/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
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
              ),
              const SizedBox(width: Sizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: Sizes.spaceBtwItems),
              CircularIcon(
                icon: Iconsax.add_copy,
                width: 40,
                height: 40,
                backgroundColor: ColorsScheme.black,
                color: ColorsScheme.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(Sizes.md),
              backgroundColor: ColorsScheme.black,
              side: BorderSide(color: ColorsScheme.black),
            ),
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
