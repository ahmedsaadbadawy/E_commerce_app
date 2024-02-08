import 'package:fast_buy/core/utils/app_router.dart';
import 'package:fast_buy/core/utils/styles.dart';
import 'package:fast_buy/core/widgets/custom_button.dart';
import 'package:fast_buy/views/login_and_signup/widgets/custom_text_form_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../core/widgets/custom_button_with_image.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Form(
          key: _formkey,
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
                controller: _emailController,
                labelText: "Email",
              ),
              CustomTextFormFieldWithTitle(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () {
                  _formkey.currentState!.validate();
                  // String email = _emailController.text;
                  // String passward = _passwordController.text;

                  if (_formkey.currentState!.validate()) {
                    //print('Done');
                  }
                },
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
                height: 50,
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
