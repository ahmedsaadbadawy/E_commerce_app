import 'package:fast_buy/constants.dart';
import 'package:fast_buy/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/app_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToHome(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Fast Buy',
          style: Styles.styleSemiBold32.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void navigateToHome(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(kKeepMeLoggedIn) ?? false;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context)
            .push(isLoggedIn ? AppRouter.kHomeView : AppRouter.kSigninScreen);
      },
    );
  }
}
