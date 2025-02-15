/*import 'package:bloc/bloc.dart';
import 'package:flutter_projects/features/movie_details/data/api/favorite_api.dart';
import 'package:flutter_projects/features/movie_details/data/model/favorite_movies_dm.dart';
import 'package:flutter_projects/features/movie_details/logic/favorite/favorite_state.dart';

class FavoriteMoviesCubit extends Cubit<FavoriteMoviesState> {
  final FavoriteApi _apiService;

  FavoriteMoviesCubit(this._apiService) : super(FavoriteMoviesInitial());

  Future<void> addMovie(FavoritesData movie) async {
    emit(FavoriteMoviesLoading());

    final result = await _apiService.addFavoriteMovie(movie);

    if (result != null) {
      emit(FavoriteMoviesSuccess(result));
    } else {
      emit(FavoriteMoviesError("Failed to add movie"));
    }
  }
}
*/
