import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/vertical_product_shimmer.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/favourites_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Wish List",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add_copy,
            onPressed: () => NavigationController.instance.changeTab(1),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                  future: controller.favouriteProducts(),
                  builder: (context, snapshot) {
                    final emptyWidget = AnimationLoader(
                      text: 'Whoops! WishList is Empty...',
                      animation: ImageStrings.pencilAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: () =>
                          NavigationController.instance.changeTab(0),
                    );

                    const loader = VerticalProductShimmer(itemCount: 6);
                    final widget =
                        CloudHelperFunctions.checkMultipleRecordsState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget,
                        );
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return GridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          ProductCardVertical(product: products[index]),
                    );
                  },
                ),
              ),
              SizedBox(
                height:
                    DeviceUtility.getBottomNavigationBarHeight() +
                    Sizes.defaultSpace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
