import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final Color borderColor = colors.primary;
    final Color errorColor = colors.error;

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: borderColor, width: 1),
    );

    final errorBorder = defaultBorder.copyWith(borderSide: BorderSide(color: errorColor, width: 1));

    bool isNullOrEmpty(String? value) {
      return value == null || value.isEmpty;
    }

    return TextFormField(
      decoration: InputDecoration(
        // Borders
        enabledBorder: defaultBorder,
        focusedBorder: defaultBorder.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder.copyWith(
          borderSide: BorderSide(color: errorColor, width: 2),
        ),

        // Contingut
        filled: false,
        isDense: true,
        label: isNullOrEmpty(label) ? null : Text(label!),
        hintText: isNullOrEmpty(hint) ? null : hint,
        focusColor: colors.primary,
        errorText: isNullOrEmpty(errorMessage) ? null : errorMessage,
      ),
      obscureText: obscureText,
      // Events
      onChanged: onChanged,
      validator: validator,
    );
  }
}
