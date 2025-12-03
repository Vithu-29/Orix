import 'package:ecommerce_flutter/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_flutter/common/widgets/login_signup/social_icons.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                TextStrings.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              //Form
              const SignupForm(),
              const SizedBox(height: Sizes.spaceBtwSections),
              //Divider
              const FormDivider(dividerText: TextStrings.orSignUpWith),
              const SizedBox(height: Sizes.spaceBtwSections),
              //Social
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
