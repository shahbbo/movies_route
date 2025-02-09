import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/customWidgets/MovieItem.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/home_tab/logic/home_tab_cubit.dart';
import '../data/model/MoviesListModel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabCubit, HomeTabState>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.sizeOf(context);
        final cubit = HomeTabCubit.get(context);
        final List<Movies>? movies = cubit.moviesListModel?.data?.movies;

        return Column(
          children: [
            Container(
              height: size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(cubit.currentMovieImage ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      ColorManager.mainColor.withOpacity(0.4),
                      ColorManager.mainColor.withOpacity(0.8),
                      ColorManager.mainColor.withOpacity(0.99),
                    ],
                    stops: [0.0, 0.2, 0.5, 0.8,0.9, 1.0],
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      ImageAssets.availableNow,
                      width: 200,
                    ),
                    CarouselSlider.builder(
                      itemCount: movies?.length,
                      itemBuilder: (context, index, realIndex) {
                        return MovieItem(
                          title: movies![index].title!,
                          rating: movies[index].rating!,
                          image: movies[index].largeCoverImage!,
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          cubit.setHomeBackgroundImage(movies![index].largeCoverImage!);
                        },
                        height: 330,
                        viewportFraction: 0.5,
                        enlargeFactor: 0.30,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayCurve: Curves.slowMiddle,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Image.asset(
                      ImageAssets.watchNow,
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
