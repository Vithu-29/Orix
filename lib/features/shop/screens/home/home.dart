import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_flutter/features/shop/controllers/products/product_controller.dart';
import 'package:ecommerce_flutter/features/shop/screens/all_products/all_products_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/category_shimmer.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/widgets/vertical_product_shimmer.dart';
import 'package:ecommerce_flutter/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
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
import '../../../../utils/device/device_utility.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                  PromoSlider(),
                  const SizedBox(height: Sizes.spaceBtwSections),

                  //Popular products
                  SectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(
                      () => AllProductsScreen(
                        title: "Popular Products",
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return VerticalProductShimmer(
                        itemCount: controller.featuredProducts.length,
                      );
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          "No Data Found",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return GridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => ProductCardVertical(
                        product: controller.featuredProducts[index],
                      ),
                    );
                  }),
                  SizedBox(
                    height:
                        DeviceUtility.getBottomNavigationBarHeight() +
                        Sizes.defaultSpace,
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
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return CategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: Sizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategories(category: category)),
            );
          },
        ),
      );
    });
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
