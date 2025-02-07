import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';

Widget buildDivider(var width, BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: ColorManager.yellowColor,
          endIndent: width * 0.03,
          indent: width * 0.15,
        ),
      ),
      Text(
        textAlign: TextAlign.end,
        'or',
        style: FontManager.robotoRegular14WhiteBlack,
      ),
      Expanded(
        child: Divider(
          color: ColorManager.yellowColor,
          endIndent: width * 0.15,
          indent: width * 0.03,
        ),
      ),
    ],
  );
}
