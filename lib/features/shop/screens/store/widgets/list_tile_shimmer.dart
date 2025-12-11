import 'package:ecommerce_flutter/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ShimmerEffectLoader(width: 50, height: 50, radius: 50),
            SizedBox(width: Sizes.spaceBtwItems),
            Column(
              children: [
                ShimmerEffectLoader(width: 100, height: 15),
                SizedBox(height: Sizes.spaceBtwItems / 2),
                ShimmerEffectLoader(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
