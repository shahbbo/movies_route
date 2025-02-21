import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/home_tab/data/model/MoviesListModel.dart';
import '../data/api/home_tab_api.dart';
part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabInitial());

  static HomeTabCubit get(context) => BlocProvider.of(context);

  MoviesListModel? moviesListModel;
  String? currentMovieImage;
  String selectedGenre = "Action";

  void setHomeBackgroundImage(String imageUrl) {
    currentMovieImage = imageUrl;
    emit(HomeBackgroundImageState());
  }

  void getMoviesList() async {
    emit(HomeTabLoading());
    try {
      moviesListModel = await HomeTabApi().getMoviesList();
      emit(HomeTabLoaded());
      setCurrentGenre();
    } catch (e) {
      emit(HomeTabError(e.toString()));
    }
  }

  void setCurrentGenre() {
    getGenres();
    print(genresSet);
    getRandomGenre();
    print(currentGenre);
    filterMovieByGenre();
    print(filteredMovies);
  }

  Set<String> genresSet = {};
  List<String> getGenres() {
    for (var movie in moviesListModel?.data?.movies ?? []) {
      genresSet.addAll(movie.genres ?? []);
    }
    return genresSet.toList();
  }

  String currentGenre = '';
  String? getRandomGenre() {
    if (genresSet.isEmpty) return null;
    final random = Random();
    currentGenre = genresSet.elementAt(random.nextInt(genresSet.length));
    return currentGenre;
  }

  List<Movies> filteredMovies = [];
  List<Movies> filterMovieByGenre() {
    if (moviesListModel?.data?.movies == null || currentGenre.isEmpty) {
      return [];
    }
    filteredMovies = moviesListModel!.data!.movies!
        .where((element) => element.genres!.contains(currentGenre))
        .toList();
    return filteredMovies;
  }

  List<Movies> filteredMoviesByGenre = [];
  void filterMoviesBySelectedGenre(String selectedGenre) {
    if (moviesListModel?.data?.movies == null) {
      return;
    }
    this.selectedGenre = selectedGenre;
    filteredMoviesByGenre = moviesListModel!.data!.movies!
        .where((movie) => movie.genres!.contains(selectedGenre))
        .toList();
    emit(HomeTabLoaded());
  }}