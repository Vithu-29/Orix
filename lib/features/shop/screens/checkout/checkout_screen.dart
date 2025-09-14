import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/cart/widgets/listview_cart_item.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/billing_amount_section.dart';
import 'widgets/coupon_code_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              CartItemListView(showAddRemoveButton: false),
              const SizedBox(height: Sizes.spaceBtwInputFields),

              //Coupon
              CouponCodeWidget(),
              const SizedBox(height: Sizes.spaceBtwSections),

              //Billing
              RoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(Sizes.md),
                backgroundColor: dark ? ColorsScheme.black : ColorsScheme.white,
                child: Column(
                  children: [
                    //pricing
                    BillingAmountSection(),
                    const SizedBox(height: Sizes.spaceBtwItems),

                    //divider
                    const Divider(),
                    const SizedBox(height: Sizes.spaceBtwItems),

                    //payment methods
                    BillingPaymentSection(),
                    const SizedBox(height: Sizes.spaceBtwItems),

                    //addresses
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: ImageStrings.successfulPaymentIcon,
              title: 'Payment Success',
              subTitle: 'Your Order will be shipped sson!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: Text("Checkout \$120.0"),
        ),
      ),
    );
  }
}
