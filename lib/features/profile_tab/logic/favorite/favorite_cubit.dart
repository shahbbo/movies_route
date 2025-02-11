import 'package:bloc/bloc.dart';
import 'package:flutter_projects/features/profile_tab/data/api/favorite_api.dart';
import 'package:flutter_projects/features/profile_tab/data/model/favorite_movies_dm.dart';
import 'package:flutter_projects/features/profile_tab/logic/favorite/favorite_state.dart';

class FavoriteMoviesCubit extends Cubit<FavoriteMoviesState> {
  final FavoriteApi _apiService;

  FavoriteMoviesCubit(this._apiService) : super(FavoriteMoviesInitial());

  Future<void> addMovie(FavoritesData movie) async {
    emit(FavoriteMoviesLoading());

    final result = await _apiService.addMovie(movie);

    if (result != null) {
      emit(FavoriteMoviesSuccess(result));
    } else {
      emit(FavoriteMoviesError("Failed to add movie"));
    }
  }
}
