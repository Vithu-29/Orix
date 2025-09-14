import 'package:flutter/material.dart';
import '../../../../../common/widgets/text_widgets/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import 'cart_item_widget.dart';
import 'quantity_add_remove_button.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) =>
          const SizedBox(height: Sizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          CartItemWidget(),
          if (showAddRemoveButton) const SizedBox(height: Sizes.spaceBtwItems),

          if (showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 70),
                    ProductQuantityAddRemove(),
                  ],
                ),
                ProductPriceText(price: "120"),
              ],
            ),
        ],
      ),
    );
  }
}
