import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/features/shop/screens/all_products/all_products_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/loaders/shimmer_effect_loader.dart';
import '../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../common/widgets/text_widgets/section_heading.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePrimaryHeaderContainer(
              child: Column(
                children: [
                  //--App Bar
                  HomeAppBar(),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  //--SearchBar
                  SearchContainer(text: "Search in Store"),
                  const SizedBox(height: Sizes.spaceBtwSections),

                  //--Categories
                  Padding(
                    padding: EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: "Popular Categories",
                          showTextButton: false,
                          textColor: ColorsScheme.white,
                        ),

                        const SizedBox(height: Sizes.spaceBtwItems),

                        HomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
            //Caroussel slider
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider(
                    banners: [
                      ImageStrings.promoBanner1,
                      ImageStrings.promoBanner2,
                      ImageStrings.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  //Popular products
                  SectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  GridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: ImageStrings.shoeIcon,
            title: "Shoes",
            onTap: () => Get.to(() => const SubCategories()),
          );
        },
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextStrings.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: ColorsScheme.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return ShimmerEffectLoader(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: ColorsScheme.white),
              );
            }
          }),
        ],
      ),
      actions: [CartCounterIcon(iconColor: ColorsScheme.white)],
    );
  }
}
