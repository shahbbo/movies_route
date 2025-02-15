import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/movie_details/data/api/movie_suggestions_api.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../home_tab/data/model/MoviesListModel.dart';
import '../../data/api/favorite_api.dart';
import '../../data/api/movie_details_api.dart';
import '../../data/model/MovieModel.dart';
import '../../data/model/favorite_movies_dm.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial()) {
    fetchFavorites(); // Fetch favorites when the cubit is created
  }
  // fetchFavorites();

  static MovieDetailsCubit of(BuildContext context) => BlocProvider.of(context);
  MovieDetailsApi movieDetailsApi = MovieDetailsApi();
  MovieSuggestionsApi movieSuggestionsApi = MovieSuggestionsApi();
  final FavoriteApi _apiService = FavoriteApi();
  MovieModel movieDetails = MovieModel();
  FavoritesData movie = FavoritesData();
  List<FavoritesData> favoriteMovies = [];

  void getMovieDetails(num movieId) {
    emit(MovieDetailsLoading());
    movieDetailsApi.getMovieDetails(movieId).then((value) {
      movieDetails = value;
      emit(MovieDetailsSuccess(movieDetails));
    }).catchError((e) {
      emit(MovieDetailsError(e.toString()));
    });
  }

  MoviesListModel movieSuggestions = MoviesListModel();
  void getSuggestions(num movieId) {
    emit(MovieSuggestionsLoading());
    movieSuggestionsApi.getSuggestions(movieId).then((value) {
      movieSuggestions = value;
      print('movieSuggestions');
      print(movieSuggestions.toJson());
      emit(MovieSuggestionsSuccess(movieDetails));
    }).catchError((e) {
      print('error in getSuggestions');
      print(e.toString());
      emit(MovieSuggestionsError(e.toString()));
    });
  }

  late YoutubePlayerController controller;

  bool isPlaying = false;

  void playTrailer() {
    isPlaying = !isPlaying;
    emit(MovieTrailerPlaying(isPlaying));
  }

  Future<void> addFavoriteMovie(FavoritesData movie) async {
    emit(FavoriteMoviesLoading());

    final result = await _apiService.addFavoriteMovie(movie);
    if (result != null) {
      favoriteMovies.add(movie);
      movieDetails.data!.movie!.likeCount =
          (movieDetails.data!.movie!.likeCount ?? 0) + 1;
      emit(FavoriteMoviesSuccess(favoriteMovies)); // updated list

      print("Sending Favorite Movie Data: ${jsonEncode(movie.toJson())}");
    } else {
      emit(FavoriteMoviesError("Failed to add movie"));
    }
  }

  Future<void> removeFavoriteMovie(String movieId) async {
    emit(FavoriteMoviesLoading());

    final result = await _apiService.removeFavoriteMovie(movieId);
    if (result) {
      favoriteMovies.removeWhere((fav) => fav.movieId == movieId);
      movieDetails.data!.movie!.likeCount =
          (movieDetails.data!.movie!.likeCount ?? 0) - 1;
      emit(FavoriteMoviesRemoved());
    } else {
      emit(FavoriteMoviesError("Failed to remove movie from favorites"));
    }
  }

  bool isMovieFavorite(String movieId) {
    return favoriteMovies.any((fav) => fav.movieId == movieId);
  }

  Future<void> fetchFavorites() async {
    emit(FavoriteMoviesLoading());

    try {
      final result = await _apiService.getFavoriteMovies();
      if (result != null) {
        print("Fetched favorite movies: ${result.length}");
        favoriteMovies = result; // Update the list

        //print("Fetched favorites: ${favoriteMovies.map((movie) => movie.toJson()).toList()}");
      } else {
        print("Failed to fetch favorites: result is null");
        emit(FavoriteMoviesError("Failed to fetch favorites"));
      }
    } catch (e) {
      print("Error fetching favorite movies: ${e.toString()}");
      emit(FavoriteMoviesError(e.toString()));
    }
  }

  Future<void> toggleFavoriteMovie(
    FavoritesData movie,
  ) async {
    if (isMovieFavorite(movie.movieId.toString())) {
      // If the movie is already in favorites, remove it
      removeFavoriteMovie(movie.movieId.toString());
    } else {
      // If the movie is not in favorites, add it
      addFavoriteMovie(movie);
    }
  }
}
