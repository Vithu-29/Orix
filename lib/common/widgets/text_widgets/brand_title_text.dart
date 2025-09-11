import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color,
    this.textAlign = TextAlign.center,
    required this.title,
    this.maxLines = 1,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final TextAlign? textAlign;
  final String title;
  final int maxLines;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
          : brandTextSize == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
