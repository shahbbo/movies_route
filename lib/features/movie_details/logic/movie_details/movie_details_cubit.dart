import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/movie_details/data/api/movie_suggestions_api.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../home_tab/data/model/MoviesListModel.dart';
import '../../data/api/movie_details_api.dart';
import '../../data/model/MovieModel.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  static MovieDetailsCubit of(BuildContext context) => BlocProvider.of(context);
  MovieDetailsApi movieDetailsApi = MovieDetailsApi();
  MovieSuggestionsApi movieSuggestionsApi = MovieSuggestionsApi();
  MovieModel movieDetails = MovieModel();
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
}
