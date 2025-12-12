import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductQuantityAddRemove extends StatelessWidget {
  const ProductQuantityAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus_copy,
          onPressed: remove,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: HelperFunctions.isDarkMode(context)
              ? ColorsScheme.white
              : ColorsScheme.black,
          backgroundColor: HelperFunctions.isDarkMode(context)
              ? ColorsScheme.darkerGrey
              : ColorsScheme.light,
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(width: Sizes.spaceBtwItems),
        CircularIcon(
          icon: Iconsax.add_copy,
          onPressed: add,
          width: 32,
          height: 32,
          size: Sizes.md,
          backgroundColor: ColorsScheme.primary,
          color: ColorsScheme.white,
        ),
      ],
    );
  }
}
