import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorMessage;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool obscureText;

  const OutlinedTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.validator,
    this.controller,
    this.focusNode,
    this.obscureText = false,
    this.errorMessage,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFC1C1C1),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(4),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        isDense: true,
        labelText: labelText != null ? (labelText!) : null,
        hintText: hintText,
        errorText: errorMessage,
        focusColor: colors.primary,
      ),
      style: const TextStyle(
        fontFamily: 'Roboto',
      ),
    );
  }

}
