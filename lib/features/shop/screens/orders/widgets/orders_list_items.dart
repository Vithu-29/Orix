import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: Sizes.spaceBtwItems),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        backgroundColor: dark ? ColorsScheme.dark : ColorsScheme.light,
        padding: EdgeInsets.all(Sizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Iconsax.ship_copy),
                SizedBox(width: Sizes.spaceBtwItems / 2),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: ColorsScheme.primary,
                          fontWeightDelta: 1,
                        ),
                      ),
                      Text(
                        "07 Sep, 2024",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.arrow_right_2, size: Sizes.iconSm),
                ),
              ],
            ),

            const SizedBox(height: Sizes.spaceBtwItems),

            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.tag_copy),
                      SizedBox(width: Sizes.spaceBtwItems / 2),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "[#256f2]",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.calendar_copy),
                      SizedBox(width: Sizes.spaceBtwItems / 2),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "15 Sep, 2025",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
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
