import 'package:fast_buy/core/utils/app_router.dart';
import 'package:fast_buy/core/utils/styles.dart';
import 'package:fast_buy/core/widgets/custom_button.dart';
import 'package:fast_buy/views/login_and_signup/widgets/custom_text_form_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants.dart';
import '../../core/widgets/custom_button_with_image.dart';
import '../../core/widgets/show_snack_bar.dart';
import 'manager/auth_cubit/auth_cubit.dart';

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

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          showSnackBar(context, 'Done!');
          GoRouter.of(context).pushReplacement(_passwordController.text == admin
              ? AppRouter.kAdminHomeView
              : AppRouter.kHomeView);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, 'there were error in logging in');
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
                left: 24, right: 24, top: width < 380 ? 40 : 50),
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  Text(
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
                  SizedBox(
                    height: width < 380 ? 20 : 30,
                  ),
                  CustomButton(
                    onTap: () async {
                      _formkey.currentState!.validate();
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      if (_formkey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .loginUser(email: email, password: password);
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
                  SizedBox(
                    height: width < 380 ? 30 : 50,
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
                          style: Styles.styleSemiBold32
                              .copyWith(fontSize: width < 380 ? 12 : 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
