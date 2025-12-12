import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/products/cart_controller.dart';
import 'widgets/listview_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Obx(() {
        //Nothing found widget for empty cart
        final emptyEidget = AnimationLoader(
          text: 'Whoops! Cart is Empty',
          showAction: true,
          animation: ImageStrings.cartAnimation,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyEidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Sizes.defaultSpace),
              child: CartItemListView(),
            ),
          );
        }
      }),
      bottomNavigationBar: Obx(() {
        return controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(Sizes.defaultSpace),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(
                    () => Text("Checkout \$${controller.totalCartPrice.value}"),
                  ),
                ),
              );
      }),
    );
  }
}
