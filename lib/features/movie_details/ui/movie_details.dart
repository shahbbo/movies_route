import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movie_details';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: height * 0.6,
                  width: width,
                  child: Image.asset(
                    ImageAssets.DoctorStrange,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: height * 0.6,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.blackCover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.20),
                    Image.asset(ImageAssets.startWatch),
                    SizedBox(height: height * 0.04),
                    Text(
                      'Doctor Strange in the Multiverse of Madness',
                      style: FontManager.robotoBold24White,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      '2022',
                      style: FontManager.robotoBold20White,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.05),
                    CustomButton(
                      title: 'Watch',
                      buttonColor: ColorManager.redColor,
                      style: FontManager.robotoBold20White,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImageAssets.loveIcon),
                        Text('15',style: FontManager.robotoBold24White,)
                      ],
                    ),
                  ),
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImageAssets.timeIcon),
                        Text('90',style: FontManager.robotoBold24White,)
                      ],
                    ),
                  ),
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImageAssets.starIcon),
                        Text('7.6',style: FontManager.robotoBold24White,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
