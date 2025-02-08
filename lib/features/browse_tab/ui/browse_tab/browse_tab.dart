import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import '../../../../core/customWidgets/MovieItem.dart';
import '../widgets/tab_category_widget.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "action".tr(context),
      "adventure".tr(context),
      "animation".tr(context),
      "biography".tr(context),
    ];
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(children: [
        DefaultTabController(
            length: categories.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: ColorManager.blackColor,
                dividerColor: ColorManager.transparentColor,
                labelPadding: EdgeInsets.symmetric(horizontal: 4),
                tabs: categories.map((filmCategory) {
                  return TabCategoryWidget(
                      isSelected:
                          selectedIndex == categories.indexOf(filmCategory),
                      filmCategory: filmCategory);
                }).toList())),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
    ));
  }
}
