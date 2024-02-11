import 'package:fast_buy/core/manager/products_cubit/products_cubit.dart';
import 'package:fast_buy/core/utils/app_router.dart';
import 'package:fast_buy/models/categories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FastBuy());
}

class FastBuy extends StatelessWidget {
  const FastBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(categories[0]),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(primary: Colors.black),
        ),
      ),
    );
  }
}
