import 'package:fast_buy/constants.dart';
import 'package:fast_buy/core/utils/app_router.dart';
import 'package:fast_buy/core/utils/services/auth.dart';
import 'package:fast_buy/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          onTap: () async {
            GoRouter.of(context).pushReplacement(AppRouter.kSigninScreen);
            Auth.signOut();
            isAdmin = false;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();
          },
          buttonName: "Log Out",
          textColor: Colors.white,
          buttonColor: Colors.red,
        ),
      ),
    );
  }
}
