import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/rating_bar_indicator_widget.dart';
import 'widgets/rating_progress_indicator.dart';
import 'widgets/user_review_card.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ratings and reviews are verified and are from people who use the smae type of device you use",
              ),
              SizedBox(height: Sizes.spaceBtwItems),

              //overall rating
              OverallProductRating(),
              RatingBarIndicatorWidget(rating: 4.5),
              Text("12,378", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: Sizes.spaceBtwSections),

              //user review list
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



class OverallProductRating extends StatelessWidget {
  const OverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text("4.7", style: Theme.of(context).textTheme.displayLarge),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(text: "5", value: 1.0),
              RatingProgressIndicator(text: "4", value: 0.6),
              RatingProgressIndicator(text: "3", value: 0.6),
              RatingProgressIndicator(text: "2", value: 0.4),
              RatingProgressIndicator(text: "1", value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
