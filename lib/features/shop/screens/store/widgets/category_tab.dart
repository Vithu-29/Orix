import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:ecommerce_flutter/features/shop/screens/all_products/all_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/category_controller.dart';
import '../../home/widgets/vertical_product_shimmer.dart';
import 'category_brands.dart';

class CategoryTab extends StatelessWidget {
  final CategoryModel category;
  const CategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              const SizedBox(height: Sizes.spaceBtwItems),

              //products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final response =
                      CloudHelperFunctions.checkMultipleRecordsState(
                        snapshot: snapshot,
                        loader: const VerticalProductShimmer(),
                      );
                  if (response != null) return response;

                  /// Record Found
                  final products = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(
                        title: 'You might like',
                        showTextButton: true,
                        onPressed: () => Get.to(
                          AllProductsScreen(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                              categoryId: category.id,
                              limit: -1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Sizes.spaceBtwItems),
                      GridLayout(
                        itemCount: products.length < 4 ? products.length : 4,
                        itemBuilder: (_, index) => ProductCardVertical(
                          product: products[index],
                          isNetworkImage: true,
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: Sizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
