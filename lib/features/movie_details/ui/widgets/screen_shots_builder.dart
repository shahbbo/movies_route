import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/text_manager.dart';

class ScreenShotsBuilder extends StatelessWidget {
  const ScreenShotsBuilder({super.key, required this.screenShots});
  final List<String> screenShots;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return screenShots.isNotEmpty
        ? SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.02),
            child: Text('Screen Shots', style: FontManager.robotoBold24White),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: screenShots.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: screenShots[index],
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    )
        : Center(child: Text("No Screenshots Available", style: FontManager.robotoBold24White))
    ;
  }
}
