import 'package:ecommerce_flutter/features/shop/screens/product_reviews/widgets/rating_bar_indicator_widget.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(ImageStrings.userProfileImage1),
                ),
                const SizedBox(width: Sizes.spaceBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.more_copy)),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        Row(
          children: [
            RatingBarIndicatorWidget(rating: 4),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text("14 Sep, 2025", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        ReadMoreText(
          "This is the review of the specified user , it's using readmore package where we can easily controll lines showing and other attributes",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "Show less",
          trimCollapsedText: "Show more",
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: ColorsScheme.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: ColorsScheme.primary,
          ),
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        RoundedContainer(
          backgroundColor: dark ? ColorsScheme.darkerGrey : ColorsScheme.grey,
          child: Padding(
            padding: EdgeInsets.all(Sizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Orix Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "15 Sep, 2025",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                ReadMoreText(
                  "This is the reply for the review by company , it's using readmore package where we can easily controll lines showing and other attributes",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "Show less",
                  trimCollapsedText: "Show more",
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsScheme.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Sizes.spaceBtwSections,),
      ],
    );
  }
}
