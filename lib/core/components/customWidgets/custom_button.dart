import 'package:flutter/material.dart';

import '../../resources/text_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.borderColor,
    this.style,
    this.buttonSize,
  });

  final String title;
  final Color buttonColor;
  final Color textColor;
  final Color? borderColor;
  final Size? buttonSize;
  final Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: buttonColor,
        minimumSize: buttonSize ?? const Size(361, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(
                  color: borderColor!,
                  width: 1.50,
                ),
        ),
      ),
      child: Text(
        title,
        style: style ?? FontManager.gothic60014().copyWith(color: textColor),
      ),
    );
  }
}
