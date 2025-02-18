import 'package:flutter/material.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';

class RateRuntimeFav extends StatelessWidget {
  RateRuntimeFav(
      {super.key,
      this.rating,
      this.runtime,
      this.likeCount,
      this.isFavorite});

  final num? rating;
  final num? runtime;
  final num? likeCount;
  final bool? isFavorite;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInfoBox(width, height, ImageAssets.loveIcon,
              likeCount?.toString() ?? "0"),
          buildInfoBox(width, height, ImageAssets.timeIcon,
              runtime?.toString() ?? "N/A"),
          buildInfoBox(
              width, height, ImageAssets.starIcon, rating?.toString() ?? "N/A"),
        ],
      ),
    );
  }

  Widget buildInfoBox(double width, double height, String icon, String text) {
    return Container(
      width: width * 0.25,
      height: height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(icon),
          Text(text, style: FontManager.robotoBold24White),
        ],
      ),
    );
  }
}
