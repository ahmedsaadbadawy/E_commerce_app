import 'package:fast_buy/models/product.dart';
import 'package:fast_buy/models/user_order.dart';
import 'package:fast_buy/views/admin/home/admin_home_view.dart';
import 'package:fast_buy/views/admin/order_details_view/order_details_view.dart';
import 'package:fast_buy/views/login_and_signup/login_screen.dart';
import 'package:fast_buy/views/login_and_signup/manager/auth_cubit/auth_cubit.dart';
import 'package:fast_buy/views/login_and_signup/signup_screen.dart';
import 'package:fast_buy/views/splash_view.dart';
import 'package:fast_buy/views/user/home/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../views/details_view/details_view.dart';

abstract class AppRouter {
  static const kSigninScreen = '/SigninScreen';
  static const kSignupScreen = '/SignupScreen';
  static const kHomeView = '/HomeView';
  static const kAdminHomeView = '/AdminHomeView';
  static const kDetailsView = '/DetailsView';
  static const kOrderDetailsView = '/OrderDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSigninScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: kSignupScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kAdminHomeView,
        builder: (context, state) => const AdminHomeView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) =>  DetailsView(
          product: state.extra as Product,
        ),
      ),
      GoRoute(
        path: kOrderDetailsView,
        builder: (context, state) =>  OrderDetailsView(
          order: state.extra as UserOrder,
        ),
      ),
    ],
  );
}
