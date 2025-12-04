import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final rememberMe = false.obs;

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? '';
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignin() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        "Logging you in...",
        ImageStrings.docerAnimation,
      );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //validate form
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //login user using email & password
      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loading
      FullScreenLoader.stopLoading();

      //redirect user
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //remove loading
      FullScreenLoader.stopLoading();

      //show error message
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
