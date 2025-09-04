import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorsScheme.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              width: Sizes.iconMd,
              height: Sizes.iconMd,
              image: AssetImage(ImageStrings.google),
            ),
          ),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorsScheme.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              width: Sizes.iconMd,
              height: Sizes.iconMd,
              image: AssetImage(ImageStrings.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
