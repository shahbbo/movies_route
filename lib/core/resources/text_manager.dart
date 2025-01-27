import 'package:flutter/material.dart';
import 'color_manager.dart';
class FontManager {
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
      fontFamily:  gothicA1,
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
    return  TextStyle(
      color: ColorManager.blackOn,
      fontSize: 14,
      fontFamily:  gothicA1,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle gothic70022() {
    return  TextStyle(
      color: Color(0xFF0A0908),
      fontSize: 22,
      fontFamily: gothicA1,
      fontWeight: FontWeight.w700,
      height: 0,
    );
  }
  static TextStyle gothic70018() {
    return  TextStyle(
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
      fontFamily:  goldmanFont,
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