import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/MovieItem.dart';
import 'package:flutter_projects/features/home_tab/data/model/MoviesListModel.dart';

import '../../../../core/resources/text_manager.dart';
import '../../logic/movie_details/movie_details_cubit.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movies});

  final List<Movies> movies;

  @override
  Widget build(BuildContext context) {
    final cubit = MovieDetailsCubit.of(context);
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' Similar Movies',
            style: FontManager.robotoBold24White,
          ),
        ),
        movies.isNotEmpty ? GridView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: movies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (cubit.controller.value.isFullScreen) {
                  cubit.controller.toggleFullScreenMode();
                }
              },
              child: MovieItem(
                title: movies[index].title ?? '',
                rating: movies[index].rating ?? 0.0,
                image: movies[index].largeCoverImage ?? movies[index].mediumCoverImage ?? '',
                movieId: movies[index].id ?? 0,
              ),
            );
          },
        ) : Center(child: Text('No Similar Movies Found' , style: FontManager.robotoBold24White,)),
      ],
    );
  }
}
