import 'package:flutter/material.dart';

import 'views/login_screen.dart';

void main() {
  runApp(const FastBuy());
}

class FastBuy extends StatelessWidget {
  const FastBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

