import 'package:appointment_app/core/theme/app_colors.dart';
import 'package:appointment_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    // basic
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.validator,
    this.onChanged,

    // icons
    this.suffixIcon,

    // decoration generic
    this.isDense = true,
    this.contentPadding,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderWidth = 1.3,
    this.borderRadius,
    this.fillColor,
    this.filled,
    this.hintStyle,
    this.textStyle,
    this.enabledBorder,
    this.focusedBorder,
  });

  // basic
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  // icons
  final Widget? suffixIcon;

  // decoration
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double borderWidth;
  final double? borderRadius;
  final Color? fillColor;
  final bool? filled;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular((borderRadius ?? 16).r);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      style: textStyle ?? TextStyles.font14DarkBlueMedium,
      decoration: InputDecoration(
        isDense: isDense,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 18.h,
              horizontal: 8.w,
            ),

        // -------- DEFAULT BORDER --------
        border: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            color: enabledBorderColor ?? AppColors.lighterGray,
            width: borderWidth,
          ),
        ),

        // -------- ENABLED BORDER --------
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ?? AppColors.lighterGray,
                width: borderWidth,
              ),
              borderRadius: radius,
            ),

        // -------- FOCUSED BORDER --------
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ?? AppColors.primary,
                width: borderWidth,
              ),
              borderRadius: radius,
            ),

        fillColor: fillColor ?? AppColors.offWhite,
        filled: filled ?? true,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14lightGrayRegular,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
