import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/data/repositories/user/user_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login.dart';
import 'package:ecommerce_flutter/features/personalization/models/user_model.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/delete_account_screen.dart';
import 'package:ecommerce_flutter/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final imageUploading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user deatails
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //first update Rx user and then check if user data is already stored.If not store new data
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //conver name into first and last
          final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '',
          );
          final username = UserModel.generateUsername(
            userCredentials.user!.displayName ?? '',
          );

          //Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile",
      );
    }
  }

  //Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(Sizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
        "Processing...",
        ImageStrings.docerAnimation,
      );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //re-auth user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          FullScreenLoader.stopLoading();
          Get.to(() => DeleteAccountScreen());
        }
      }
    } catch (e) {
      //remove loading
      FullScreenLoader.stopLoading();

      //show error message
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //Re-authenticate before delete
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog(
        "Processing...",
        ImageStrings.docerAnimation,
      );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //validate form
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();

      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      //remove loading
      FullScreenLoader.stopLoading();

      //show error message
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        //upload image to supabase
        final imageUrl = await userRepository.uploadImage(
          "profile_pics",
          image,
        );

        //update user image record in firestore
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your Profile Image has been updated!",
        );
      }
    } catch (e) {
      Loaders.errorSnackBar(
        title: "Oh Snap!",
        message: "Something went wrong: $e",
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
