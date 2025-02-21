import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/home_tab/logic/home_tab_cubit.dart';
import 'package:meta/meta.dart';

import '../../home_tab/data/api/home_tab_api.dart';
import '../../home_tab/data/model/MoviesListModel.dart';

part 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseInitial());

  static BrowseCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  String selectedCategory = "";

  void setSelectedCategory(BuildContext context) {
    final cubit = HomeTabCubit.get(context);
    selectedIndex = cubit.genresSet.toList().indexOf(cubit.currentGenre);
    print('selectedIndex: $selectedIndex');
    selectedCategory = cubit.currentGenre;
    print('selectedCategory: $selectedCategory');
    emit(BrowseSelectedCategory());
  }

  void setIndex(int index , BuildContext context) {
    selectedIndex = index;
    selectedCategory = HomeTabCubit.get(context).genresSet.toList()[index];
    emit(BrowseSelectedCategory());
  }

  MoviesListModel? moviesListByGenre;
  void getMoviesListByGenre(String genre) async {
    emit(BrowseLoading());
    try {
      moviesListByGenre = await HomeTabApi().getMoviesList(selectedCategory);
      emit(BrowseLoaded());
    } catch (e) {
      emit(BrowseError(e.toString()));
    }
  }
}