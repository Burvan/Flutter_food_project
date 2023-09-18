import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? helperText;
  final String labelText;
  final bool obscureText;
  final Icon icon;

  const AppTextField({
    required this.controller,
    required this.validator,
    this.helperText,
    required this.labelText,
    required this.obscureText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: labelText,
        helperText: helperText
      ),
    );
  }
}
