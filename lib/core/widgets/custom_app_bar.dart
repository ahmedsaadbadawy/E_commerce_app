import 'package:fast_buy/constants.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        SizedBox(
          width: width * 0.13,
        ),
        Text(title, style: Styles.styleSemiBold32),
      ],
    );
  }
}
