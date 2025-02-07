import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class FontManager {
  static TextStyle robotoBold24White = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static TextStyle robotoBold36White = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 36,
      fontWeight: FontWeight.bold);
  static TextStyle robotoBold20White = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle robotoRegular16White = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w400);
  static TextStyle robotoRegular14Yellow = GoogleFonts.roboto(
      color: ColorManager.yellowColor,
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static TextStyle robotoBlack14Yellow = GoogleFonts.roboto(
      color: ColorManager.yellowColor,
      fontSize: 14,
      fontWeight: FontWeight.w900);
  static TextStyle robotoRegular16Yellow = GoogleFonts.roboto(
      color: ColorManager.yellowColor,
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static TextStyle robotoRegular14White = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static TextStyle robotoRegular20White = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w400);
  static TextStyle robotoRegular20Black = GoogleFonts.roboto(
      color: ColorManager.blackColor,
      fontSize: 20,
      fontWeight: FontWeight.w400);
  static TextStyle robotoRegular16Black = GoogleFonts.roboto(
      color: ColorManager.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w400);
  static TextStyle interMedium36White = GoogleFonts.inter(
      color: ColorManager.primaryWhiteColor,
      fontSize: 36,
      fontWeight: FontWeight.w500);
  static TextStyle interBold24White = GoogleFonts.inter(
      color: ColorManager.primaryWhiteColor,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static TextStyle interBold20Black = GoogleFonts.inter(
      color: ColorManager.blackColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle interBold20Yellow = GoogleFonts.inter(
      color: ColorManager.yellowColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle interSemiBold20Yellow = GoogleFonts.inter(
      color: ColorManager.yellowColor,
      fontSize: 20,
      fontWeight: FontWeight.w600);
  static TextStyle interRegular20White = GoogleFonts.inter(
      color: ColorManager.lowWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w400);
  static TextStyle interSemiBold20Black = GoogleFonts.inter(
      color: ColorManager.blackColor,
      fontSize: 20,
      fontWeight: FontWeight.w600);

  static TextStyle robotoRegular14WhiteBlack = GoogleFonts.roboto(
      color: ColorManager.yellowColor,
      fontSize: 14,
      fontWeight: FontWeight.w900);
  static TextStyle robotoRegular20WhiteBlack = GoogleFonts.roboto(
      color: ColorManager.primaryWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w400);

  static const String goldmanFont = "Goldman";
  static const String gothicA1 = "GothicA1";
  static TextStyle gothic60018() {
    return TextStyle(
      color: Color(0xFFFFFFFC),
      fontSize: 18,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle gothic60014() {
    return TextStyle(
      color: ColorManager.blackOn,
      fontSize: 14,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle gothic60016() {
    return TextStyle(
      color: ColorManager.blackOn,
      fontSize: 16,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle gothic50014() {
    return TextStyle(
      color: ColorManager.blackOn,
      fontSize: 14,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle gothic70022() {
    return TextStyle(
      color: Color(0xFF0A0908),
      fontSize: 22,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w700,
      height: 0,
    );
  }

  static TextStyle gothic70018() {
    return TextStyle(
      color: Color(0xFF0A0908),
      fontSize: 18,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w700,
      height: 0,
    );
  }

  static TextStyle goldman70045() {
    return TextStyle(
      color: Color(0xFFFFFFFC),
      fontSize: 45,
      fontFamily: goldmanFont,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle goldman70018() {
    return TextStyle(
      color: ColorManager.blackOn,
      fontSize: 18,
      fontFamily: goldmanFont,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle gothic50010() {
    return TextStyle(
      fontSize: 10,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle gothic50018() {
    return TextStyle(
      fontSize: 18,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle goldman70024() {
    return TextStyle(
      fontSize: 24,
      color: Color(0xFF0A0908),
      fontFamily: goldmanFont,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle gothic40014() {
    return TextStyle(
      fontSize: 14,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle gothic70016() {
    return TextStyle(
      fontSize: 16,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w700,
    );
  }
}
