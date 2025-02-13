import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';

class GenresGrid extends StatelessWidget {
  const GenresGrid({super.key, required this.genres});

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  Genres',
          style: FontManager.robotoBold24White,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        genres.isNotEmpty ? Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: genres.length,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3),
              itemBuilder: (context, index) {
                return buildGenresCard(
                    genre: genres[index], width: width, height: height);
              }),
        ) : Center(child: Text("No Genres Available", style: FontManager.robotoRegular16White)),
      ],
    );
  }
}

Widget buildGenresCard(
    {required String genre, required double width, required double height}) {
  return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      decoration: BoxDecoration(
        color: ColorManager.darkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        genre,
        style: FontManager.robotoRegular16White,
      ));
}
