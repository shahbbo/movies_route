import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';


class TabsWidget extends StatelessWidget {
 bool isSelected;
 String element;
 // List <IconData> iconName;

 TabsWidget({required this.isSelected,
 required this.element,
 });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: ColorManager.yellowColor
      ),
      child: Text(element,
      style: FontManager.robotoRegular20White,),
    );
  }
}
