import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  final int itemCount;
  const VerticalProductShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerEffectLoader(width: 180, height: 180),
            SizedBox(height: Sizes.spaceBtwItems),
            ShimmerEffectLoader(width: 160, height: 15),
            SizedBox(height: Sizes.spaceBtwItems / 2),
            ShimmerEffectLoader(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
