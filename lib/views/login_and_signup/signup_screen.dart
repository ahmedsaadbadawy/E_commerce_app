import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/custom_button.dart';
import 'widgets/custom_text_form_field_with_title.dart';

// ignore: must_be_immutable
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 20),
        child: Form(
          key: _formkey,
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
                controller: _nameController,
                labelText: "Full Name",
              ),
              CustomTextFormFieldWithTitle(
                controller: _emailController,
                labelText: "Email",
              ),
              CustomTextFormFieldWithTitle(
                controller: _phoneController,
                labelText: "Phone",
              ),
              CustomTextFormFieldWithTitle(
                labelText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                onTap: () {
                  _formkey.currentState!.validate();
                  // String email = _emailController.text;
                  // String passward = _passwordController.text;
                  // String phone = _phoneController.text;
                  // String name = _nameController.text;

                  if (_formkey.currentState!.validate()) {
                    GoRouter.of(context).pop();
                  }
                },
                buttonName: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
