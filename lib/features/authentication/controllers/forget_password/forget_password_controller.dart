import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send reset password emal
  sendPasswordResetEmail() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        "Processing your request...",
        ImageStrings.docerAnimation,
      );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      FullScreenLoader.stopLoading();

      //show success screen
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Email Link Sent to Reset your Password",
      );

      //Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      //remove loading
      FullScreenLoader.stopLoading();

      //show error message
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        "Processing your request...",
        ImageStrings.docerAnimation,
      );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      //show success screen
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Email Link Sent to Reset your Password",
      );
    } catch (e) {
      //remove loading
      FullScreenLoader.stopLoading();

      //show error message
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
