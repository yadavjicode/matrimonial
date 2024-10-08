import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'font_constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Color? labelTextColor;
  final String? hintText;
  final int? maxlength;
  final int? maxline;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? borderRadius;
  final Color? borderColor;

  const CustomTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.labelTextColor,
      this.hintText,
      this.maxlength,
      this.obscureText,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.maxline,
      this.onTap,
      this.borderRadius,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: FontConstant.styleRegular(
                fontSize: 16, color: labelTextColor ?? Colors.black),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          onTap: onTap,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLength: maxlength ?? 500,
          maxLines: maxline ?? 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            counterText: "",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 23),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 23),
              borderSide: BorderSide(
                color:borderColor?? Colors.black.withOpacity(0.4),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 23),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 23),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
