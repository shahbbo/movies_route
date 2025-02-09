import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/home_tab/data/model/MoviesListModel.dart';
import 'package:meta/meta.dart';

import '../data/api/home_tab_api.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabInitial());

  static HomeTabCubit get(context) => BlocProvider.of(context);

  MoviesListModel? moviesListModel;
  String? currentMovieImage;

  void setHomeBackgroundImage(String imageUrl) {
    currentMovieImage = imageUrl;
    emit(HomeBackgroundImageState());
  }
  void getMoviesList() async {
    emit(HomeTabLoading());
    try {
      moviesListModel = await HomeTabApi().getMoviesList();
      print('moviesListModel');
      print(moviesListModel);
      emit(HomeTabLoaded());
    } catch (e) {
      print('error');
      print(e.toString());
      emit(HomeTabError(e.toString()));
    }
  }

}
