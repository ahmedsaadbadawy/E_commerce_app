import 'package:fast_buy/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonName,
    this.textColor = Colors.white,
    this.buttonColor = Colors.black,
  });

  final VoidCallback onTap;
  final String buttonName;
  final Color? textColor;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            buttonName,
            style: Styles.styleMedium16.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
