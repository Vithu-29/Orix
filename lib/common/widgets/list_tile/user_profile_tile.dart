import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../image_shapes/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(
        image: ImageStrings.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        "Vithushan",
        style: Theme.of(context).textTheme.headlineSmall!.apply(
          color: ColorsScheme.white,
        ),
      ),
      subtitle: Text(
        "Vithuvithush44@gmail.com",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: ColorsScheme.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Iconsax.edit, color: ColorsScheme.white),
      ),
    );
  }
}