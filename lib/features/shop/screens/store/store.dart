import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../common/widgets/image_shapes/circular_image.dart';
import '../../../../common/widgets/products/cart/cart_counter_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
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
                    SectionHeading(title: "Featured Brands", onPressed: () {}),
                    const SizedBox(height: Sizes.spaceBtwItems / 1.5),

                    GridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: RoundedContainer(
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: CircularImage(
                                    isNetworkImage: false,
                                    image: ImageStrings.clothIcon,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: dark
                                        ? ColorsScheme.white
                                        : ColorsScheme.black,
                                  ),
                                ),
                                const SizedBox(width: Sizes.xs),

                                //Text
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Nike",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleLarge,
                                          ),
                                          const SizedBox(width: Sizes.xs),
                                          Icon(
                                            Iconsax.verify,
                                            color: ColorsScheme.primary,
                                            size: Sizes.iconXs,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "256 products",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
