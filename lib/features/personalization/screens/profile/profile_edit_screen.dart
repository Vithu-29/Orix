import 'package:ecommerce_flutter/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_flutter/common/widgets/image_shapes/circular_image.dart';
import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'widgets/profile_menu.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Profile"), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              CircularImage(image: ImageStrings.user, width: 80, height: 80),
              TextButton(
                onPressed: () {},
                child: Text("Change Profile Picture"),
              ),

              //details
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              SectionHeading(
                title: "Profile Information",
                showTextButton: false,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),

              ProfileMenu(onPressed: () {}, title: 'Name', value: 'Vithushan'),
              ProfileMenu(onPressed: () {}, title: 'Username', value: 'Vithu'),

              const SizedBox(height: Sizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),

              SectionHeading(
                title: "Personal Information",
                showTextButton: false,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),

              ProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '12345',
                icon: Iconsax.copy_copy,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'vithuvithush44@gmail.com',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: '0761234567',
              ),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '29 Jun, 2000',
              ),

              const Divider(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
