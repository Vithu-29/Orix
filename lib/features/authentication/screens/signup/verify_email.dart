import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                width: HelperFunctions.screenWidth() * 0.6,
                image: AssetImage(ImageStrings.deliveredEmailIllustration),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              //Title & Subtitle
              Text(
                TextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(
                TextStrings.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(TextStrings.tContinue),
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(TextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
