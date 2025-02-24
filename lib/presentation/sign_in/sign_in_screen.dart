import 'package:flutter/material.dart';
import 'package:flutter_sample_app/core/presentation/components/big_button.dart';
import 'package:flutter_sample_app/core/presentation/components/input_field.dart';
import 'package:flutter_sample_app/ui/color_styles.dart';
import 'package:flutter_sample_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  final void Function() onTapSignUp;

  const SignInScreen({super.key, required this.onTapSignUp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Hello', style: TextStyles.headerTextBold),
              Text('Welcome Back!', style: TextStyles.largeTextRegular),
              const SizedBox(height: 57),
              InputField(label: 'Email', placeHolder: 'Enter Email'),
              const SizedBox(height: 30),
              InputField(
                label: 'Enter Password',
                placeHolder: 'Enter Password',
              ),
              const SizedBox(height: 20),
              Text(
                'Forget Password?',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.secondary100,
                ),
              ),
              const SizedBox(height: 25),
              BigButton(text: 'Sign In', onPressed: () {}),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 1, color: ColorStyles.gray4),
                  const SizedBox(width: 7),
                  Text(
                    'Or Sign in With',
                    style: TextStyles.smallerTextBold.copyWith(
                      color: ColorStyles.gray4,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(width: 50, height: 1, color: ColorStyles.gray4),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google_button.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 15),
                  Image.asset(
                    'assets/images/facebook_button.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyles.smallerTextBold,
                  ),
                  GestureDetector(
                    onTap: onTapSignUp,
                    child: Text(
                      'Sign up',
                      style: TextStyles.smallerTextBold.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
