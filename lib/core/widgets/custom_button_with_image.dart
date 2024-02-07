import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButtonWithImage extends StatelessWidget {
  const CustomButtonWithImage({
    super.key,
    required this.onPressed,
    required this.buttonName,
    required this.textColor,
    required this.buttonColor,
    required this.imageUrl,
  });
  final VoidCallback onPressed;
  final String buttonName;
  final String imageUrl;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: const BorderSide(color: Color(0xFFAAAAAA)),
          backgroundColor: buttonColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 38,
              height: 38,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              buttonName,
              style: Styles.styleMedium16.copyWith(
                color: textColor,
              ),
            ),
          ],
        ));
  }
}
