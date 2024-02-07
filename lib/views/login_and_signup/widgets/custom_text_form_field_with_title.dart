import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import 'custom_text_form_field.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.labelText,
    this.onChanged,
    this.obscureText = false,
  });
  final String labelText;
  final Function(String)? onChanged;
  final bool? obscureText;

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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: 341,
            height: 53,
            child: CustomTextFormField(
              obscureText: obscureText,
              onChanged: onChanged,
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}
