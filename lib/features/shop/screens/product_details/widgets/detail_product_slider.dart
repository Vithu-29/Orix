import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_flutter/features/shop/controllers/products/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edged_widget.dart';
import '../../../../../common/widgets/image_shapes/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class DetailProductSlider extends StatelessWidget {
  final ProductModel product;
  const DetailProductSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CurvedEdgedWidget(
      child: Container(
        color: dark ? ColorsScheme.darkerGrey : ColorsScheme.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final selectedImage = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(selectedImage),
                      child: CachedNetworkImage(
                        imageUrl: selectedImage,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: ColorsScheme.primary,
                            ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            //image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: Sizes.spaceBtwItems),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return RoundedImage(
                      width: 80,
                      border: Border.all(
                        color: imageSelected
                            ? ColorsScheme.primary
                            : Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(Sizes.sm),
                      backgroundColor: dark
                          ? ColorsScheme.dark
                          : ColorsScheme.white,
                      imageUrl: images[index],
                      isNetworkImage: true,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
              ),
            ),

            //Appbar icons
            CustomAppBar(
              showBackArrow: true,
              actions: [FavouriteIcon(productId: product.id)],
            ),
          ],
        ),
      ),
    );
  }
}
