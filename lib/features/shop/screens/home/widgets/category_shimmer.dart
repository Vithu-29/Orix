import 'package:ecommerce_flutter/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  final int itemCount;
  const CategoryShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: Sizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffectLoader(width: 55, height: 55, radius: 55),
              SizedBox(height: Sizes.spaceBtwItems / 2),
              ShimmerEffectLoader(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
