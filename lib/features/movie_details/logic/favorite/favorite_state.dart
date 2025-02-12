import '../../data/model/favorite_movies_dm.dart';

abstract class FavoriteMoviesState {}

class FavoriteMoviesInitial extends FavoriteMoviesState {}

class FavoriteMoviesLoading extends FavoriteMoviesState {}

class FavoriteMoviesSuccess extends FavoriteMoviesState {
  final FavoriteMoviesDm favoriteMovies;
  FavoriteMoviesSuccess(this.favoriteMovies);
}

class FavoriteMoviesError extends FavoriteMoviesState {
  final String error;
  FavoriteMoviesError(this.error);
}
