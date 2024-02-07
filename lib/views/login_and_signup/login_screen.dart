import 'package:fast_buy/core/utils/app_router.dart';
import 'package:fast_buy/core/utils/styles.dart';
import 'package:fast_buy/core/widgets/custom_button.dart';
import 'package:fast_buy/views/login_and_signup/widgets/custom_text_form_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../core/widgets/custom_button_with_image.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? email;

  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Form(
          child: ListView(
            children: [
              const Text(
                'Welcome Back!',
                style: Styles.styleSemiBold32,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 35,
              ),
              CustomTextFormFieldWithTitle(
                labelText: "Email",
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(height: 33),
              CustomTextFormFieldWithTitle(
                labelText: "Password",
                onChanged: (data) {
                  password = data;
                },
                obscureText: true,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                onTap: () {},
                buttonName: 'Sign In',
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 50,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                  Text(
                    'Or',
                    style: Styles.styleRegular16.copyWith(
                      color: khintColor,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      height: 50,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ],
              ),
              CustomButtonWithImage(
                textColor: Colors.black,
                buttonColor: Colors.white,
                onPressed: () {},
                buttonName: "Sign In with Google",
                imageUrl:
                    'http://pngimg.com/uploads/google/google_PNG19635.png',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButtonWithImage(
                textColor: Colors.white,
                buttonColor: const Color(0xff0866FF),
                onPressed: () {},
                buttonName: "Sign In with FaceBook",
                imageUrl:
                    'https://seeklogo.com/images/F/facebook-new-2023-logo-4221611926-seeklogo.com.png?v=638313429180000000',
              ),
              const SizedBox(
                height: 76,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don\'t have an account? ',
                    style: TextStyle(color: khintColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kSignupScreen);
                    },
                    child: Text(
                      'Sign Up',
                      style: Styles.styleSemiBold32.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
