import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/profile_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../image_shapes/circular_image.dart';
import '../loaders/shimmer_effect_loader.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key}); //

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty
            ? networkImage
            : ImageStrings.user;
        if (controller.imageUploading.value) {
          return const ShimmerEffectLoader(width: 50, height: 50, radius: 50);
        } else {
          return CircularImage(
            image: image,
            width: 50,
            height: 50,
            isNetworkImage: networkImage.isNotEmpty,
          );
        }
      }),
      title: Obx(
        () => Text(
          controller.user.value.fullName,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: ColorsScheme.white),
        ),
      ),
      subtitle: Obx(
        () => Text(
          controller.user.value.email,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.apply(color: ColorsScheme.white),
        ),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => const ProfileEditScreen()),
        icon: Icon(Iconsax.edit_copy, color: ColorsScheme.white),
      ),
    );
  }
}
