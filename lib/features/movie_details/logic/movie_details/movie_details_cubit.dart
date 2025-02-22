
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
    fetchFavorites();
  }
  // fetchFavorites();
  bool isFavorite = false;
  static MovieDetailsCubit of(BuildContext context) => BlocProvider.of(context);
  MovieDetailsApi movieDetailsApi = MovieDetailsApi();
  MovieSuggestionsApi movieSuggestionsApi = MovieSuggestionsApi();
  final FavoriteApi _apiService = FavoriteApi();
  MovieModel movieDetails = MovieModel();
  FavoritesData movie = FavoritesData();
  List<FavoritesData> favoriteMovies = [];

  void getMovieDetails(num movieId) {
    emit(MovieDetailsLoading());
    initializeController();
    movieDetailsApi.getMovieDetails(movieId).then((value) async {
      movieDetails = value;
      await isFavoriteMovie(movieId.toString()); // load favorite statu
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
      emit(MovieSuggestionsSuccess(movieDetails));
    }).catchError((e) {
      emit(MovieSuggestionsError(e.toString()));
    });
  }

  late YoutubePlayerController controller;

  void initializeController() {
    controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  bool isPlaying = false;
  late PlayerState playerState;

  void playTrailer() {
    isPlaying = !isPlaying;
    playerState = controller.value.playerState;
    emit(MovieTrailerPlaying(isPlaying));
  }

  Future<void> addFavoriteMovie(FavoritesData movie) async {
    emit(FavoriteMoviesLoading());
    final result = await _apiService.addFavoriteMovie(movie);
    if (result != null) {
      movieDetails.data!.movie!.likeCount =
          (movieDetails.data!.movie!.likeCount ?? 0) + 1;
      emit(FavoriteMoviesSuccess()); // updated list
    } else {
      emit(FavoriteMoviesError("Failed to add movie"));
    }
  }

  Future<void> removeFavoriteMovie(String movieId) async {
    emit(FavoriteMoviesLoading());

    final result = await _apiService.removeFavoriteMovie(movieId);
    if (result) {
      // favoriteMovies.removeWhere((fav) => fav.movieId == movieId);
      movieDetails.data!.movie!.likeCount =
          (movieDetails.data!.movie!.likeCount ?? 0) - 1;
      emit(FavoriteMoviesRemoved());
    } else {
      emit(FavoriteMoviesError("Failed to remove movie from favorites"));
    }
  }

  /*bool isMovieFavorite(String movieId) {
    return favoriteMovies.any((fav) => fav.movieId == movieId);
  }*/

  Future<bool> isFavoriteMovie(String movieId) async {
    bool isFav = await _apiService.isFavoriteMovieApi(movieId);
    isFavorite = isFav; // update the isfavorite state
    emit(MovieDetailsSuccess(movieDetails)); // update ui
    return isFav;
  }

  Future<void> fetchFavorites() async {
    emit(FavoriteMoviesLoading());
    try {
      final result = await _apiService.getFavoriteMovies();
      if (result != null) {
        favoriteMovies = result; // Update the list
        print(
            "Fetched favorites: ${favoriteMovies.map((movie) => movie.toJson()).toList()}");
      } else {
        emit(FavoriteMoviesError("Failed to fetch favorites"));
      }
    } catch (e) {
      emit(FavoriteMoviesError(e.toString()));
    }
  }

  Future<void> toggleFavoriteMovie(
    FavoritesData movie,
  ) async {
    bool isFavorite = await isFavoriteMovie(movie.movieId.toString());

    if (isFavorite) {
      // if isfavorite remove
      await removeFavoriteMovie(movie.movieId.toString());
    } else {
      // if is not favorite add
      await addFavoriteMovie(movie);
    }

    // refresh the favorite from the api
    await isFavoriteMovie(movie.movieId.toString());
  }
}
