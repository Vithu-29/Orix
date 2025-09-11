import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_flutter/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edged_widget.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
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
            onTap: () {},
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
          Text(
            TextStrings.homeAppBarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: ColorsScheme.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(iconColor: ColorsScheme.white, onPressed: () {}),
      ],
    );
  }
}

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: ColorsScheme.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: ColorsScheme.white,
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePrimaryHeaderContainer extends StatelessWidget {
  const HomePrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgedWidget(
      child: Container(
        color: ColorsScheme.primary,
        padding: EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: ColorsScheme.textWhite.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: ColorsScheme.textWhite.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
