import 'package:ecommerce_flutter/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEffectLoader(width: 150, height: 110)),
            SizedBox(width: Sizes.spaceBtwItems),
            Expanded(child: ShimmerEffectLoader(width: 150, height: 110)),
            SizedBox(width: Sizes.spaceBtwItems),
            Expanded(child: ShimmerEffectLoader(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
