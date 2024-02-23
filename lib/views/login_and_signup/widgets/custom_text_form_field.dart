import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.obscureText,
    required this.onChanged,
    required this.labelText,
    required this.controller,
  });

  final bool? obscureText;
  final Function(String p1)? onChanged;
  final String labelText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      validator: (data) {
        if (labelText == 'Email') {
          return emailValidation(data);
        } else if (data!.isEmpty) {
          return 'field is required';
        } else if (data.length < 6) {
          return "$labelText must be at least 6 characters long";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Enter your $labelText',
        hintStyle: Styles.styleRegular16,
        contentPadding: EdgeInsets.only(
            left: 22,
            right: 10,
            top: width < 380 ? 10 : 16,
            bottom: width < 380 ? 12 : 16),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.black,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          gapPadding: 16,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          gapPadding: 16,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 2,
          ),
        ),
      ),
    );
  }

  String? emailValidation(String? data) {
    if (data!.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(data)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
