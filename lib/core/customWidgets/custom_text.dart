import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/color_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? ColorManager.offWhite,
      ),
    );
  }
}