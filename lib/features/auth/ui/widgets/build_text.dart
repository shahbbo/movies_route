import 'package:flutter/material.dart';

import '../../../../core/resources/text_manager.dart';

Widget buildtext(BuildContext context, String text1, String text2,
    MainAxisAlignment mainAxisAlignment, void Function()? onTap) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Text(
        textAlign: TextAlign.end,
        text1,
        style: FontManager.robotoRegular14White,
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          textAlign: TextAlign.end,
          text2,
          style: FontManager.robotoRegular14WhiteBlack,
        ),
      ),
    ],
  );
}
