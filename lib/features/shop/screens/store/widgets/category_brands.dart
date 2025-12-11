import 'package:ecommerce_flutter/common/widgets/brands/brand_showcase.dart';
import 'package:ecommerce_flutter/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/brand_controller.dart';
import '../../../models/category_model.dart';
import 'boxes_shimmer.dart';
import 'list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            ListTileShimmer(),
            SizedBox(height: Sizes.spaceBtwItems),
            BoxesShimmer(),
            SizedBox(height: Sizes.spaceBtwItems),
          ],
        );
        final widget = CloudHelperFunctions.checkMultipleRecordsState(
          snapshot: snapshot,
          loader: loader,
        );
        if (widget != null) return widget;

        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (_, snapshot) {
                final widget = CloudHelperFunctions.checkMultipleRecordsState(
                  snapshot: snapshot,
                  loader: loader,
                );
                if (widget != null) return widget;

                /// Record Found
                final products = snapshot.data!;
                return BrandShowCase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}
