import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.isActive = false,
    required this.title,
  });
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? Colors.black : kGrayColor,
      ),
      child: Text(
        title,
        style: Styles.styleMedium16
            .copyWith(color: isActive ? Colors.white : Colors.black),
      ),
    );
  }
}
