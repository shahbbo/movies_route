import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

class TabCategoryWidget extends StatelessWidget {
  TabCategoryWidget(
      {super.key, required this.isSelected, required this.filmCategory});
  bool isSelected;
  String filmCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorManager.yellowColor,
          width: 1.5,
        ),
        color: isSelected ? ColorManager.yellowColor : ColorManager.blackColor,
      ),
      child: Text(filmCategory,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                isSelected ? ColorManager.blackColor : ColorManager.yellowColor,
          )),
    );
  }
}
