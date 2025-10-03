import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Popular Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.sort_copy),
                ),
                items:
                    [
                          'Name',
                          'Higher Price',
                          'Lower Price',
                          'Sale',
                          'Newest',
                          'Popularity',
                        ]
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              GridLayout(
                itemCount: 6,
                itemBuilder: (_, index) => ProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
