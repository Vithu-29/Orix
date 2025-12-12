import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../common/widgets/text_widgets/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/products/cart_controller.dart';
import 'cart_item_widget.dart';
import 'quantity_add_remove_button.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: Sizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              //single cart item
              CartItemWidget(cartItem: item),

              if (showAddRemoveButton)
                const SizedBox(height: Sizes.spaceBtwItems),

              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        ProductQuantityAddRemove(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    ProductPriceText(
                      price: (item.price * item.quantity).toStringAsFixed(1),
                    ),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
