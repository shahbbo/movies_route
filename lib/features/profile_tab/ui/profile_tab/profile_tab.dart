import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';

import '../../../../core/customWidgets/MovieItem.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * .06),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  ImageAssets.profile1,
                ),
                SizedBox(height: height * .02),
                Text('John Safwat', style: FontManager.robotoBold20White),
              ],
            ),
            Column(
              children: [
                Text('12', style: FontManager.robotoBold36White),
                Text('Wish List', style: FontManager.robotoBold24White),
              ],
            ),
            Column(
              children: [
                Text('10', style: FontManager.robotoBold36White),
                Text('History', style: FontManager.robotoBold24White),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * .03, vertical: height * .02),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: ColorManager.yellowColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {},
                    child: Text('Edit Profile',
                        style: FontManager.robotoRegular20Black)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * .03, vertical: height * .02),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: ColorManager.redColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Exit', style: FontManager.robotoRegular20White),
                        Icon(
                          Icons.exit_to_app,
                          color: ColorManager.whiteFc,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
        DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: ColorManager.whiteFc,
                  unselectedLabelColor: ColorManager.whiteFc,
                  labelStyle: FontManager.robotoRegular20White,
                  indicatorColor: ColorManager.yellowColor,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.menu_open,
                        color: ColorManager.yellowColor,
                        size: 30,
                      ),
                      text: "watchList".tr(context),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.folder,
                        color: ColorManager.yellowColor,
                        size: 30,
                      ),
                      text: "history".tr(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .44,
                  child: TabBarView(children: [
                    Center(
                      child: Image.asset(ImageAssets.watchedListImage),
                    ),
                    //AddMovieScreen(),
                    SizedBox(
                      height:
                          height * .44, // Set a fixed height for the GridView
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return MovieItem(
                            title: "Movie Title",
                            rating: 8.5,
                            image: ImageAssets.blackWidowImage,
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                  ]),
                )
              ],
            )),
      ],
    );
  }
}
