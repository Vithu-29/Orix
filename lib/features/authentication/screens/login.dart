import 'package:ecommerce_flutter/common/styles/spacing_style.dart';
import 'package:ecommerce_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_flutter/common/widgets/login_signup/social_icons.dart';
import 'package:ecommerce_flutter/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/forget_password.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:ecommerce_flutter/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo ,title,subtitle
              LoginHeader(dark: dark),
              //form
              LoginForm(),
              //divider
              FormDivider(dividerText: TextStrings.orSignInWith),
              const SizedBox(height: Sizes.spaceBtwSections),
              //footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TextStrings.email,
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    Validator.validateEmptyText(value, "Password"),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TextStrings.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields / 2),

            //Remember me & Forgot Pw
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(TextStrings.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: Text(TextStrings.forgetPassword),
                ),
              ],
            ),

            const SizedBox(height: Sizes.spaceBtwSections),

            //Login Button & create account
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignin(),
                child: Text(TextStrings.signIn),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: Text(TextStrings.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
            dark ? ImageStrings.lightAppLogo : ImageStrings.darkAppLogo,
          ),
        ),
        Text(
          TextStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Sizes.sm),
        Text(
          TextStrings.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
