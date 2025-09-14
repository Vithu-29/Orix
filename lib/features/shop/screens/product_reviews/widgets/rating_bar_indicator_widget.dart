import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../utils/constants/colors.dart';

class RatingBarIndicatorWidget extends StatelessWidget {
  const RatingBarIndicatorWidget({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: ColorsScheme.grey,
      itemBuilder: (_, __) => Icon(Iconsax.star_1, color: ColorsScheme.primary),
    );
  }
}