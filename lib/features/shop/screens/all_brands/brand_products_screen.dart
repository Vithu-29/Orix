import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Nike"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(children: [
            BrandCard(showBorder: true,),
            const SizedBox(height: Sizes.spaceBtwItems,),
            SortableProducts(),
          ]),
        ),
      ),
    );
  }
}
