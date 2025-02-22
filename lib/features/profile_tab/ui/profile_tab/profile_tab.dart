import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/app_layout/logic/app_cubit.dart';
import 'package:flutter_projects/features/auth/ui/login_screen/login_screen.dart';
import 'package:flutter_projects/features/edit_profile/ui/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter_projects/features/profile_tab/data/Api/Api_profile-Tab.dart';
import 'package:flutter_projects/features/profile_tab/ui/profile_tab/widgets/get_favMovie.dart';
import '../../../../core/customWidgets/MovieItem.dart';
import '../../../edit_profile/logic/edit_profile_cubit/edit_profile_cubit.dart';
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
    context.read<ProfileCubit>().loadHistoryMovies();
  }

  FavouriteMoviesApi favApi = FavouriteMoviesApi();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final List<String> profileImages = [
      ImageAssets.profile1,
      ImageAssets.profile2,
      ImageAssets.profile3,
      ImageAssets.profile4,
      ImageAssets.profile5,
      ImageAssets.profile6,
      ImageAssets.profile7,
      ImageAssets.profile8,
      ImageAssets.profile9,
    ];

    return BlocProvider(
  create: (context) => ProfileCubit(profileRepo: ProfileRepoImplementation())
    ..fetchProfile(),
  child: BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          context.read<ProfileCubit>().fetchProfile();
        }
      },
      builder: (context, state) {
        final profile = context.read<ProfileCubit>().profile;
        final moviesHistory = context.read<ProfileCubit>().moviesHistory;
        return profile == null
            ? CircularProgressIndicator(
                color: ColorManager.whiteFc,
              )
            : Column(
                children: [
                  SizedBox(height: height * .06),
                  Padding(
                    padding: const EdgeInsets.only(left: 11, right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        state is ProfileLoading
                            ? CircularProgressIndicator(
                                color: ColorManager.whiteFc,
                              )
                            : Column(
                                children: [
                                  Image.asset(
                                    profileImages[profile.avatarId],
                                    height: height * .1,
                                  ),
                                  SizedBox(height: height * .02),
                                  Text(profile.name,
                                      style: FontManager.robotoBold20White),
                                ],
                              ),
                        Column(
                          children: [
                            Text(
                                context
                                        .read<UserFavCubit>()
                                        .favMovies
                                        ?.length
                                        .toString() ??
                                    '0',
                                style: FontManager.robotoBold24White),
                            Text('Wish List',
                                style: FontManager.robotoBold20White),
                          ],
                        ),
                        Column(
                          children: [
                            Text(moviesHistory.length.toString(),
                                style: FontManager.robotoBold24White),
                            Text('History',
                                style: FontManager.robotoBold20White),
                          ],
                        ),
                      ],
                    ),
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
                                navigateWithFade(
                                    context,
                                    EditProfileScreen(
                                      name: profile.name,
                                      phone: profile.phone,
                                    ));
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
                                CacheHelper.clearData(key: 'Token');
                                CacheHelper.clearData(key: 'userId');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (route) => false);
                                AppCubit.get(context)
                                    .changeBottomNavigationBarIndex(0);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Exit',
                                      style: FontManager.robotoRegular20White),
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
                              if (index == 1) {
                                context
                                    .read<ProfileCubit>()
                                    .loadHistoryMovies();
                              }
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
                                GetFavMovie(),
                                moviesHistory.isEmpty
                                    ? Center(
                                        child: Text("No movies in history",
                                            style:
                                                FontManager.robotoBold20White))
                                    : GridView.builder(
                                        padding: EdgeInsets.all(8),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 0.7,
                                          crossAxisSpacing: 12,
                                          mainAxisSpacing: 20,
                                        ),
                                        itemCount: moviesHistory.length,
                                        itemBuilder: (context, index) {
                                          final movie = moviesHistory[index];
                                          return MovieItem(
                                              title: movie.title ?? '',
                                              rating: movie.rating ?? 0,
                                              image:
                                                  movie.largeCoverImage ?? '',
                                              movieId: movie.id!);
                                        },
                                      ),
                              ]))
                        ],
                      )),
                ],
              );
      },
    ),
);
  }
}
