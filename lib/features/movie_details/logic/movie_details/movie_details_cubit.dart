import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/api/movie_details_api.dart';
import '../../data/model/MovieModel.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  static MovieDetailsCubit of(BuildContext context) => BlocProvider.of(context);
  MovieDetailsApi movieDetailsApi = MovieDetailsApi();

  MovieModel movieDetails = MovieModel();
  void getMovieDetails(num movieId) {
    emit(MovieDetailsLoading());
     movieDetailsApi.getMovieDetails(movieId).then((value) {
      movieDetails = value;
      emit(MovieDetailsSuccess(movieDetails));
    }).catchError((e) {
      print('error in getMovieDetails');
      print(e.toString());
      emit(MovieDetailsError(e.toString()));
    });
  }
}
