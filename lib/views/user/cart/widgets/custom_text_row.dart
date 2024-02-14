import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.txt1,
    required this.txt2,
  });
  final String txt1, txt2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt1,
          style: Styles.styleRegular16.copyWith(color: Colors.grey),
        ),
        Text(txt2, style: Styles.styleMedium16),
      ],
    );
  }
}
