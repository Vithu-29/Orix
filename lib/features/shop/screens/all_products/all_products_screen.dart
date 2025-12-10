import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/vertical_product_shimmer.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/products/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  const AllProductsScreen({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: CustomAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = VerticalProductShimmer();
              final widget = CloudHelperFunctions.checkMultipleRecordsState(
                snapshot: snapshot,
                loader: loader,
              );
              if (widget != null) return widget;

              final products = snapshot.data!;
              return SortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
