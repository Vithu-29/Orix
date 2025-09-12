import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edged_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/image_shapes/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class DetailProductSlider extends StatelessWidget {
  const DetailProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CurvedEdgedWidget(
      child: Container(
        color: dark ? ColorsScheme.darkerGrey : ColorsScheme.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(ImageStrings.productImage1)),
                ),
              ),
            ),

            //image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: Sizes.spaceBtwItems),
                  itemCount: 4,
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    border: Border.all(color: ColorsScheme.primary),
                    padding: const EdgeInsets.all(Sizes.sm),
                    backgroundColor: dark
                        ? ColorsScheme.dark
                        : ColorsScheme.white,
                    imageUrl: ImageStrings.productImage1,
                  ),
                ),
              ),
            ),

            //Appbar icons
            CustomAppBar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}