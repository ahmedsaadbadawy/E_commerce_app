import 'package:fast_buy/views/login_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSignupScreen = '/SignupScreen';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    
  ]);
}