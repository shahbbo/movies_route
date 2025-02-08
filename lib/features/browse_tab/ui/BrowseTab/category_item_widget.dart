import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import '../../../../core/resources/asset_manager.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage(ImageAssets.blackWidowImage),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.blackColor.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 4))
            ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManager.mainColor,
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '7.7',
                      style: TextStyle(
                          color: ColorManager.whiteFc,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellowColor,
                      size: 16,
                    )
                  ])),
            ]));
  }
}
