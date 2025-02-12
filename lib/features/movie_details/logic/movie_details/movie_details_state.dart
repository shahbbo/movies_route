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


final class MovieSuggestionsLoading extends MovieDetailsState {}

final class MovieSuggestionsSuccess extends MovieDetailsState {
  final MovieModel movieSuggestions;

  MovieSuggestionsSuccess(this.movieSuggestions);
}

final class MovieSuggestionsError extends MovieDetailsState {
  final String error;

  MovieSuggestionsError(this.error);
}