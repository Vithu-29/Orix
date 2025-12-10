import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../../models/brand_model.dart';
import '../home/widgets/vertical_product_shimmer.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    final future = controller.getBrandProducts(brand.id);
    return Scaffold(
      appBar: CustomAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true, brand: brand),
              const SizedBox(height: Sizes.spaceBtwItems),
              FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  const loader = VerticalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultipleRecordsState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return SortableProducts(products: brandProducts);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
