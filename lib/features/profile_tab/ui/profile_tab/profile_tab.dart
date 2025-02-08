import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/string_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';

import '../../../../core/customWidgets/MovieItem.dart';
import '../widgets/tabs_widget.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> tabsWidgetList = [
      "watchList".tr(context),
      "history".tr(context),
    ];
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
        SizedBox(height: height * .06),
        DefaultTabController(
            length: 2,
            child:Column(
              children: [
                TabBar(
                onTap: (index) {
                          selectedIndex = index;
                          setState(() {});
                         },
                  indicatorColor: ColorManager.yellowColor,
                    tabs: [
                      Tab(text: "watchList".tr(context),),
                      Tab(text: "history".tr(context),),

                    ]),
                Container(
                  height: 300,
                  child: TabBarView(
                      children: [
                        Center(
                          child: Image.asset(ImageAssets.watchedListImage),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                //mainAxisSpacing: 5,
                                childAspectRatio: 0.7),
                            itemBuilder: (context, index) {
                              return MovieItem(
                                  title: "Movie Title",
                                  rating: "8.5",
                                  image: ImageAssets.blackWidowImage
                              );
                            },
                            itemCount: 10,
                          ),
                        )
                      ]),
                )
              ],
            ))
        // DefaultTabController(
        //     length: tabsWidgetList.length,
        //     child: Column(
        //       children: [
        //         TabBar(
        //             onTap: (index) {
        //               selectedIndex = index;
        //               setState(() {});
        //             },
        //             indicatorColor: ColorManager.yellowColor,
        //             tabs: tabsWidgetList.map((element) {
        //               return TabsWidget(
        //                   isSelected:
        //                       selectedIndex == tabsWidgetList.indexOf(element),
        //                   element: element);
        //             }).toList()),
        //         TabBarView(children: [
        //           // WatchListScreen()
        //         ])
        //       ],
        //     )),
      ],
    );
  }
}
