import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import '../resources/text_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonColor,
     this.textColor,
    this.borderColor,
    this.style,
    this.icon,
    this.iconColor,
    this.buttonSize,
    this.isLoading = false,
  });

  final String title;
  final Color buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;
  final Size? buttonSize;
  final dynamic icon;
  final Function()? onPressed;
  final TextStyle? style;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon == IconData
                ? Icon(icon,
                    size: 50, color: iconColor ?? ColorManager.blackColor)
                : Image(
                    image: icon as ImageProvider,
                    width: width * 0.08,
                    height: height * 0.03,
                  ),
            const SizedBox(width: 8),
          ],
          Text(title, style: style ?? FontManager.robotoRegular20Black),
        ],
      ),
    );
  }
}
