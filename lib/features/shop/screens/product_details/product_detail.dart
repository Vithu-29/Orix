import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../../utils/constants/enums.dart';
import 'widgets/detail_product_slider.dart';
import 'widgets/rating_and_share_buton.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            DetailProductSlider(product: product),

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
                  ProductMetaData(product: product),

                  //Attributes
                  if (product.productType == ProductType.variable.toString())
                    ProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: Sizes.spaceBtwSections),
                  //Checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const CheckoutScreen()),
                      child: Text("Checkout"),
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  //Description
                  SectionHeading(title: "Description", showTextButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? 'No description available.',
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
                  SectionHeading(
                    title: "Reviews(199)",
                    onPressed: () => Get.to(() => const ProductReviews()),
                  ),
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
