import 'package:ecommerce_flutter/features/authentication/screens/login.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  //called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  screenRedirect() async {
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

  //Email auth - Signin
  //Email auth - signup
  //Re-authenticate
  //Email verification
  //Email authentication - forgot password

  //google sign in
  //facebook sign in

  //logout user
  //delete user
}
