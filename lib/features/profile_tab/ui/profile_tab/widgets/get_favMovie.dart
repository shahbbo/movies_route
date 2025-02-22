import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/customWidgets/MovieItem.dart';
import 'package:flutter_projects/features/profile_tab/logic/fav_cubit/user_fav__cubit.dart';

import '../../../../../core/resources/asset_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/text_manager.dart';

class GetFavMovie extends StatelessWidget {
  const GetFavMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFavCubit, UserFavState>(
      builder: (context, state) {
        if (state is FavMoviesLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.whiteFc,
            ),
          );
        } else if (state is FavMoviesError) {
          return Center(
            child: Text(
              "Error: ${state.errorMessage}",
              style: FontManager.robotoBold20White,
            ),
          );
        } else if (state is FavMoviesSuccess) {
          final favMovies = context.watch<UserFavCubit>().favMovies ?? [];

          if (favMovies.isEmpty) {
            return Center(
              child: Image(image: AssetImage(ImageAssets.watchedListImage)),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: favMovies.length,
            itemBuilder: (context, index) {
              final movie = favMovies[index];
              return MovieItem(
                movieId: int.tryParse(movie.movieId) ?? 0,
                title: movie.name,
                rating: movie.rating,
                image: movie.imageUrl,
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
