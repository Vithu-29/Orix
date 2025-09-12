import 'package:ecommerce_flutter/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/detail_product_slider.dart';
import 'widgets/rating_and_share_buton.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


