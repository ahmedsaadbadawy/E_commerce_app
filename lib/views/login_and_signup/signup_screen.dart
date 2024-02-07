import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/custom_button.dart';
import 'widgets/custom_text_form_field_with_title.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  String? email;

  String? password;

  String? name;

  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Form(
          child: ListView(
            children: [
              const Text(
                'Create an account',
                style: Styles.styleSemiBold32,
                textAlign: TextAlign.start,
              ),
              Text(
                'Let’s create your account',
                style: Styles.styleRegular16.copyWith(color: khintColor),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 35,
              ),
              CustomTextFormFieldWithTitle(
                labelText: "Full Name",
                onChanged: (data) {
                  name = data;
                },
              ),
              const SizedBox(height: 33),
              CustomTextFormFieldWithTitle(
                labelText: "Email",
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(height: 33),
              CustomTextFormFieldWithTitle(
                labelText: "Phone",
                onChanged: (data) {
                  phone = data;
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
                height: 40,
              ),
              CustomButton(
                onTap: () {},
                buttonName: 'Let\'s Get Started',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already a member? ',
                    style: TextStyle(color: khintColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'Log In',
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
