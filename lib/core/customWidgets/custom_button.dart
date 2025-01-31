import 'package:flutter/material.dart';

import '../resources/text_manager.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.borderColor,
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          foregroundColor: WidgetStatePropertyAll(buttonColor),
          minimumSize:
              WidgetStatePropertyAll(buttonSize ?? const Size(400, 55)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor!,
                    width: 1.50,
                  ),
          ))),
      child: Text(title, style: style ?? FontManager.robotoRegular20Black),
    );
  }
}
