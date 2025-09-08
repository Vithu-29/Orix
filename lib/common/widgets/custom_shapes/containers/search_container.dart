import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    this.icon = Iconsax.search_normal_1_copy,
    required this.text,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final IconData? icon;
  final String text;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
        child: Container(
          width: DeviceUtility.getScreenWidth(context),
          padding: EdgeInsets.all(Sizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                      ? ColorsScheme.dark
                      : ColorsScheme.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
            border: showBorder ? Border.all(color: ColorsScheme.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: ColorsScheme.darkerGrey),
              const SizedBox(width: Sizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
