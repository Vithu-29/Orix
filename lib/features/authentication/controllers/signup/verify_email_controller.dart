import 'dart:async';

import 'package:ecommerce_flutter/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //send verify email whenever verify screen appears & timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Please check your inbox and verify your email.",
      );
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //timer to redirect
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: ImageStrings.successfullyRegisterAnimation,
            title: TextStrings.yourAccountCreatedTitle,
            subTitle: TextStrings.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  //manually check verify status
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: ImageStrings.successfullyRegisterAnimation,
          title: TextStrings.yourAccountCreatedTitle,
          subTitle: TextStrings.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
