import 'package:ecommerce_flutter/features/shop/controllers/products/all_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  final List<ProductModel> products;
  const SortableProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          initialValue: controller.selectedSortOption.value,
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale']
              .map(
                (option) =>
                    DropdownMenuItem(value: option, child: Text(option)),
              )
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        Obx(
          () => GridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                ProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
