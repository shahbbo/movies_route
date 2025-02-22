import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/customWidgets/MovieItem.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../data/model/MoviesListModel.dart';
import '../../logic/home_tab_cubit.dart';

class MoviesCarouselSlider extends StatelessWidget {
  const MoviesCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeTabCubit.get(context);
    final List<Movies>? movies = cubit.moviesListModel?.data?.movies;
    return SingleChildScrollView(
      child: movies!.isEmpty
          ? CircularProgressIndicator()
          : Column(
              children: [
                Image.asset(
                  ImageAssets.availableNow,
                  width: 200,
                ),
                CarouselSlider.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index, realIndex) {
                    return MovieItem(
                      movieId: movies[index].id!,
                      title: movies[index].title!,
                      rating: movies[index].rating!,
                      image: movies[index].largeCoverImage!,
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      cubit.setHomeBackgroundImage(movies[index].largeCoverImage!);
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
    );
  }
}
