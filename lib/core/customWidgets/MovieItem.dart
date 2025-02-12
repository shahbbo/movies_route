import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

class MovieItem extends StatelessWidget {
  const MovieItem(
      {super.key,
      required this.title,
      required this.rating,
      required this.image});

  final String title;
  final num rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        width: size.width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: CachedNetworkImageProvider(image), fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.blackColor.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 4))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.mainColor,
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "$rating",
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
