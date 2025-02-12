import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';
import '../../data/model/MovieModel.dart';

class CastBuilder extends StatelessWidget {
  const CastBuilder({super.key, this.movieCast});

  final List<Cast>? movieCast;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Text(
          '  Cast',
          style: FontManager.robotoBold24White,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          // height: height * 0.4,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: movieCast!.length,
              itemBuilder: (context, index) {
                return buildCastCard(
                    name: movieCast![index].name!,
                    character: movieCast![index].characterName!,
                    image: movieCast![index].urlSmallImage!,
                    width: width,
                    height: height);
              }),
        ),
      ],
    );
  }
}

Widget buildCastCard(
    {required String name,
    required String character,
    required String image,
    required double width,
    required double height}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: height * 0.01),
    padding:
        EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
    decoration: BoxDecoration(
      color: ColorManager.darkGrey,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name : $name',
              style: FontManager.robotoRegular20White,
            ),
            Text(
              'Character : $character',
              style: FontManager.robotoRegular20White,
            ),
          ],
        )
      ],
    ),
  );
}
