import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget(
      {super.key,
      required this.description,
      required this.image,
      required this.title});
  final String title;
  final String description;

  final String image;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
