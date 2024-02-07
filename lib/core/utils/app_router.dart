import 'package:fast_buy/views/login_and_signup/login_screen.dart';
import 'package:fast_buy/views/login_and_signup/signup_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSigninScreen = '/';
  static const kSignupScreen = '/SignupScreen';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: kSignupScreen,
      builder: (context, state) => SignupScreen(),
    ),
  ]);
}
