import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/tab_bar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_flutter/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_flutter/features/shop/screens/all_brands/all_brands_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../all_brands/brand_products_screen.dart';
import 'widgets/brand_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final dark = HelperFunctions.isDarkMode(context);
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterIcon()],
        ),

        //body
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? Colors.black : ColorsScheme.white,
                expandedHeight: 420,

                flexibleSpace: Padding(
                  padding: EdgeInsets.all(Sizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: Sizes.spaceBtwItems),
                      SearchContainer(
                        text: "Search in Store",
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: Sizes.spaceBtwSections),

                      //brands
                      SectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: Sizes.spaceBtwItems / 1.5),

                      Obx(() {
                        if (brandController.isLoading.value) {
                          return BrandShimmer();
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              "No Products Found",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }
                        return GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 70,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return BrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () => Get.to(
                                () => BrandProductsScreen(brand: brand),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
                // Tab bar
                bottom: CategoryTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => CategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
