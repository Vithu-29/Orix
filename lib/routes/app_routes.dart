import 'package:ecommerce_flutter/features/authentication/screens/forget_password.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/user_address.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/profile_edit_screen.dart';
import 'package:ecommerce_flutter/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce_flutter/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/home.dart';
import 'package:ecommerce_flutter/features/shop/screens/orders/order_list_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_flutter/features/shop/screens/store/store.dart';
import 'package:ecommerce_flutter/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.favourites, page: () => const WishlistScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
    GetPage(name: Routes.productReviews, page: () => const ProductReviews()),
    GetPage(name: Routes.order, page: () => const OrderListScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileEditScreen()),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: Routes.signup, page: () => const SignupScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: Routes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
