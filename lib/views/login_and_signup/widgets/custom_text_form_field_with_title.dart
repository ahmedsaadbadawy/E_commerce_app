import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/styles.dart';
import 'custom_text_form_field.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.labelText,
    this.onChanged,
    this.obscureText = false,
    required this.controller,
  });
  final String labelText;
  final Function(String)? onChanged;
  final bool? obscureText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Styles.styleMedium16,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 341,
          height: width < 380 ? 60 : 80,
          child: CustomTextFormField(
            obscureText: obscureText,
            onChanged: onChanged,
            labelText: labelText,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
