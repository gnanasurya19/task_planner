import 'package:flutter/material.dart';
import 'package:task_planner/theme/colors.dart';
import 'package:task_planner/global.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    this.hintText,
    this.validator,
    required this.controller,
    this.obscureText,
  });
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: style.text.regular,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style.text.regular.copyWith(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        errorStyle: style.text.regularSmall,
        filled: true,
        isDense: true,
        visualDensity: VisualDensity.comfortable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(style.radius.sm),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.tertiary.withValues(alpha: 0.3),
      ),
    );
  }
}
