import 'package:fast_buy/core/utils/services/auth.dart';
import 'package:fast_buy/models/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../constants.dart';
import '../../core/utils/app_router.dart';
import '../../core/utils/services/store.dart';
import '../../core/utils/styles.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/show_snack_bar.dart';
import 'manager/auth_cubit/auth_cubit.dart';
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

  final _addressController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Store().addUserInfo(
            UserInfo(
              uName: _nameController.text,
              uPhone: _phoneController.text,
              uAddress: _addressController.text,
            ),
            Auth.getUserId(),
          );
          showSnackBar(context, 'Done!');
          GoRouter.of(context).pushReplacement(AppRouter.kSigninScreen);
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, 'there were error in signing in');
        }
      },
      child: Scaffold(
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
                CustomTextFormFieldWithTitle(
                  labelText: "Address",
                  controller: _addressController,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onTap: () {
                    _formkey.currentState!.validate();
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String name = _nameController.text;

                    if (_formkey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).registerUser(
                          email: email, password: password, name: name);
                    }
                  },
                  buttonName: 'Log In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
