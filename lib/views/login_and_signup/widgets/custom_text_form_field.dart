import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.obscureText,
    required this.onChanged,
    required this.labelText,
  });

  final bool? obscureText;
  final Function(String p1)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Enter your $labelText',
        hintStyle: Styles.styleRegular16,
        //fillColor: Color(0xffF2F2F2),
        //filled: true,
        contentPadding: const EdgeInsets.only(
            left: 22, right: 10, top: 16, bottom: 16),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.black,
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
}
