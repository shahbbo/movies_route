import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_manager.dart';


class CustomTextFormFeild extends StatelessWidget {
   CustomTextFormFeild({
    super.key,
    required this.controller,
    this.valdation,
    this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    required this.hint,
    this.labelStyle,
    this.style,
    this.onChanged,
    this.maxLines,
    this.keyboardType,
    this.enabled,
    this.obscureText, this.hintStyle, this.titleStyle,
    this.validator,
    this.onTap,
  });

  final String? title;
  final dynamic controller;
  final String? valdation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final String hint;
  final bool? enabled;
  final bool? obscureText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final TextInputType? keyboardType;


  String? Function(String?)? validator ;
   void Function()? onTap;
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title == null
            ? const SizedBox(
          height: 0,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: titleStyle ?? FontManager.robotoRegular16Black,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          enabled: enabled ?? true,
          obscureText: obscureText ?? false,
          obscuringCharacter: '*',
          style: style,
          readOnly: readOnly ?? false,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            labelStyle: labelStyle,
            hintText: hint,
            fillColor: ColorManager.darkGray,
            filled: true,
            hintStyle: hintStyle ?? FontManager.robotoRegular16White.copyWith(color: Color(0xFF7C7C7C)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          validator: validator == null ? (value) {
            if (value!.isEmpty) {
              return valdation;
            }
            return null;
          } : validator,
        ),
      ],
    );
  }
}
