import 'package:flutter/material.dart';
import 'package:grocesry_app/core/app_colors.dart';
import 'package:grocesry_app/core/app_styles.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({
    super.key,
    this.icon,
    this.isPassword = false,
    required this.controller,
    this.onChanged,
    this.siffixIcon,
    this.hintText,
    this.suffixOnPressed,
    this.contentPadding,
    this.radius = 40,
    this.minLines,
    this.maxLines,
    this.labelText,
    this.border = const OutlineInputBorder(),
    this.fillColor,
    this.filled,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final bool isPassword;
  final IconData? siffixIcon;
  final void Function(String)? onChanged;
  final void Function()? suffixOnPressed;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final int? minLines;
  final int? maxLines;
  final InputBorder? border;
  final Color? fillColor;
  final bool? filled;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.minLines,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      controller: widget.controller,
      obscureText: widget.isPassword ? !isVisible : false,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "${widget.labelText} is required";
        }
        return null;
      },

      style: AppStyles.bodyMedium,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        filled: widget.filled,
        fillColor: widget.fillColor,
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        prefixIconColor: AppColors.textSecondary,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.textSecondary,
                ),
              )
            : IconButton(
                onPressed: widget.suffixOnPressed,
                icon: Icon(widget.siffixIcon),
                color: AppColors.textSecondary,
              ),
        hintText: widget.hintText,
        hintStyle: AppStyles.hint,
        labelText: widget.labelText,
        labelStyle: AppStyles.bodyMedium,
        border: widget.border,
      ),
    );
  }
}
