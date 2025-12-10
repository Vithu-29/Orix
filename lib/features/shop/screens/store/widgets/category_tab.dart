import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class CategoryTab extends StatelessWidget {
  final CategoryModel category;
  const CategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              BrandShowCase(
                images: [
                  ImageStrings.productImage3,
                  ImageStrings.productImage2,
                  ImageStrings.productImage1,
                ],
              ),
              BrandShowCase(
                images: [
                  ImageStrings.productImage3,
                  ImageStrings.productImage2,
                  ImageStrings.productImage1,
                ],
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              SectionHeading(title: "You might like", onPressed: () {}),
              const SizedBox(height: Sizes.spaceBtwItems),

              GridLayout(
                itemCount: 4,
                itemBuilder: (_, index) =>
                    ProductCardVertical(product: ProductModel.empty()),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
