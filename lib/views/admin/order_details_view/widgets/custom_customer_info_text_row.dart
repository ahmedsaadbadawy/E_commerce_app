import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomCustomerInfoTextRow extends StatelessWidget {
  const CustomCustomerInfoTextRow({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: Styles.styleMedium16.copyWith(color: Colors.grey[700]),
          maxLines: 6,
        ),
      ],
    );
  }
}
