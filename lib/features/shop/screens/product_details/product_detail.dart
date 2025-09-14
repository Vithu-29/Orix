import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'widgets/detail_product_slider.dart';
import 'widgets/rating_and_share_buton.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            DetailProductSlider(),

            //product details
            Padding(
              padding: EdgeInsets.only(
                right: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //Ratings & share
                  RatingAndShareButton(),

                  //price , title, stock & brand
                  ProductMetaData(),

                  //Attributes
                  ProductAttributes(),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  //Checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Checkout"),
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  //Description
                  SectionHeading(title: "Description", showTextButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  ReadMoreText(
                    "This is the description of the product , using readmore package in flutter , here you can setup num of lines and trim mode like some properties etc.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  SectionHeading(title: "Reviews(199)", onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
