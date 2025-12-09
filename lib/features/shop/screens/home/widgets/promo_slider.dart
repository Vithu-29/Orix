import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/image_shapes/rounded_image.dart';
import '../../../../../common/widgets/loaders/shimmer_effect_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return ShimmerEffectLoader(height: 190, width: double.infinity);
      }
      if (controller.banners.isEmpty) {
        return const Center(child: Text("No Data Found!"));
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map(
                    (banner) => RoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      CircularContainer(
                        width: 20,
                        height: 4,
                        backgroundColor:
                            controller.carouselCurrentIndex.value == i
                            ? ColorsScheme.primary
                            : ColorsScheme.grey,
                        margin: EdgeInsets.only(right: 10),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
