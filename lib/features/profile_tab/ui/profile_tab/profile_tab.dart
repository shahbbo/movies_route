import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/edit_profile/ui/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter_projects/features/profile_tab/data/Api/Api_profile-Tab.dart';
import 'package:flutter_projects/features/profile_tab/ui/profile_tab/widgets/get_favMovie.dart';

import '../../../../core/customWidgets/MovieItem.dart';
import '../../data/api/favourite_movie_api.dart';
import '../../logic/fav_cubit/user_fav__cubit.dart';
import '../../logic/profile_cubit/profile_cubit.dart';
import '../../logic/profile_state/profile_state.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<UserFavCubit>().getFavMovies();
  }
  FavouriteMoviesApi favApi = FavouriteMoviesApi();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>ProfileCubit(profileRepo:ProfileRepoImplementation() )..fetchProfile() ,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
      if (state is ProfileLoading){
        return  Center(
          child: CircularProgressIndicator(
            color: ColorManager.whiteFc,
          ),
        );
      }
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
                      onPressed: () {
                        navigateWithFade(context, EditProfileScreen());
                      },
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
                      onPressed: () {
                        favApi.getFavouriteMovieList();
                      },
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
                    child: TabBarView(
                        children: [
                          
                          GetFavMovie(),
                          Container(
                          )
                        ])
                  )
                ],
              )),
        ],
      );
        },
      ),
    );
  }
}

