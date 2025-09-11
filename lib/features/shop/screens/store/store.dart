import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/app_bar/tab_bar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/cart/cart_counter_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterIcon(onPressed: () {})],
        ),

        //body
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? ColorsScheme.black : ColorsScheme.white,
                expandedHeight: 440,

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
                        onPressed: () {},
                      ),
                      const SizedBox(height: Sizes.spaceBtwItems / 1.5),

                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return BrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),
                // Tab bar
                bottom: CategoryTabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Cloths")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab()
            ],
          ),
        ),
      ),
    );
  }
}
