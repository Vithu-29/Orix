import 'package:ecommerce_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_flutter/features/personalization/models/user_model.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;

  Future<void> signup() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        "We are processing your information...",
        ImageStrings.docerAnimation,
      );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //validate form
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account, you must accept our privacy policy & terms.",
        );
        return;
      }

      //authenticate user
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      //save authenticated user data to firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loading
      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
        title: "Congratulations!",
        message:
            "Your account has been created. Verify your email to continue.",
      );

      //move to email verification screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //remove loading
      FullScreenLoader.stopLoading();

      //show error message
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
