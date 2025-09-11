import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/image_shapes/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map(
                (url) => RoundedImage(imageUrl: url,),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carouselCurrentIndex.value == i
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
}
