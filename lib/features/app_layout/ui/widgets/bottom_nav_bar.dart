import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/home_tab/logic/home_tab_cubit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import '../../logic/app_cubit.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<String> navBarIcons = [
    ImageAssets.homeIcon,
    ImageAssets.searchIcon,
    ImageAssets.browseIcon,
    ImageAssets.profileIcon,
  ];

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BottomBar(
          barColor: Colors.transparent,
          width: double.infinity,
          body: (BuildContext context, ScrollController controller){
            return SafeArea(
                child: StreamBuilder(
                    stream: Connectivity().onConnectivityChanged,
                    builder: (context , snapshot){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            snapshot.data?[0] == ConnectivityResult.none
                                ? Expanded(
                              child: Center(
                                child: Icon(Icons.wifi_off,
                                  size: 100,
                                  color: ColorManager.yellowColor,),
                              ),
                            )
                                : Expanded(
                              child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  transitionBuilder: (Widget child, Animation<double> animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  child: appCubit.appTabs[appCubit.currentIndex]),
                            ),
                          ],
                        ),
                      );
                    }
                )
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                enableFeedback: true,
                currentIndex: appCubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: ColorManager.darkGray,
                onTap: (index) {
                  appCubit.changeBottomNavigationBarIndex(index);
                  HomeTabCubit.get(context).setCurrentGenre();
                },
                items: navBarIcons.map((icon) =>
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(icon,
                        colorFilter: ColorFilter.mode(
                          appCubit.currentIndex == navBarIcons.indexOf(icon)
                              ? ColorManager.yellowColor
                              : ColorManager.whiteFc,
                          BlendMode.srcIn,
                        ),),
                      label: '',
                    )).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
