import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/image_shapes/rounded_image.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Sports shirts"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              //top banner image
              RoundedImage(
                imageUrl: ImageStrings.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              //Subcategories
              Column(
                children: [
                  SectionHeading(title: "Sports Shoes", onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: Sizes.spaceBtwItems),
                      itemBuilder: (context, index) => ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
