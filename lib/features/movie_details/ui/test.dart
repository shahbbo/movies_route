/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/resources/toasts.dart';
import 'package:flutter_projects/features/movie_details/data/model/favorite_movies_dm.dart';
import 'package:flutter_projects/features/movie_details/logic/favorite/favorite_cubit.dart';
import 'package:flutter_projects/features/movie_details/logic/favorite/favorite_state.dart';

class AddMovieScreen extends StatelessWidget {
  final FavoritesData movie = FavoritesData(
    movieId: "monaaa",
    name: "Test Movie",
    rating: 2.4,
    imageUrl: "https://imagelink",
    year: "2002",
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<FavoriteMoviesCubit, FavoriteMoviesState>(
        listener: (context, state) {
          if (state is FavoriteMoviesSuccess) {
            Toasts.success("movie add success", context);
          } else if (state is FavoriteMoviesError) {
            Toasts.error(state.error, context);
          }
        },
        builder: (context, state) {
          if (state is FavoriteMoviesLoading) {
            return CircularProgressIndicator();
          }
          return ElevatedButton(
            onPressed: () {
              context.read<FavoriteMoviesCubit>().addMovie(movie);
            },
            child: Text("Add Movie"),
          );
        },
      ),
    );
  }
}*/
