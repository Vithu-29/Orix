import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/loaders/shimmer_effect_loader.dart';

class BrandShimmer extends StatelessWidget {
  final int itemCount;
  const BrandShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (_, __) => const ShimmerEffectLoader(width: 300, height: 80),
    );
  }
}
