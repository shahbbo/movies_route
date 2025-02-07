import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/components.dart';

import '../../../../core/resources/text_manager.dart';
import '../register_screen/register_screen.dart';

Widget buildtext(BuildContext context,String text1,String text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        textAlign: TextAlign.end,
        text1,
        style: FontManager.robotoRegular14White,
      ),
      InkWell(
        onTap: () {
          navigateWithFade(context, RegisterScreen());
        },
        child: Text(
          textAlign: TextAlign.end,
          text2,
          style: FontManager.robotoRegular14WhiteBlack,
        ),
      ),
    ],
  );
}