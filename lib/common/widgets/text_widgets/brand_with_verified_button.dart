import 'package:ecommerce_flutter/common/widgets/text_widgets/brand_title_text.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class BrandWithVerifiedButton extends StatelessWidget {
  const BrandWithVerifiedButton({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = ColorsScheme.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: Sizes.xs),
        Icon(Iconsax.verify, color: iconColor, size: Sizes.iconXs),
      ],
    );
  }
}
