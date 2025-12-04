import 'package:ecommerce_flutter/features/authentication/screens/login.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  //Email auth - Signin
  //Email auth - signup/register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw DefinedFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw DefinedFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const DefinedFormatException();
    } on PlatformException catch (e) {
      throw DefinedPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  //Re-authenticate
  //Email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw DefinedFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw DefinedFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const DefinedFormatException();
    } on PlatformException catch (e) {
      throw DefinedPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }
  //Email authentication - forgot password

  //google sign in
  //facebook sign in

  //logout user
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw DefinedFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw DefinedFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const DefinedFormatException();
    } on PlatformException catch (e) {
      throw DefinedPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  //delete user
}
