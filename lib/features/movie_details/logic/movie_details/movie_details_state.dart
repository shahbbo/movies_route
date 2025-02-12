part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieModel movieDetails;

  MovieDetailsSuccess(this.movieDetails);
}

final class MovieDetailsError extends MovieDetailsState {
  final String error;

  MovieDetailsError(this.error);
}
