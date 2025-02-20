import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/api/favourite_movie_api.dart';
import '../../data/model/favourite_movie_dm.dart';

part 'user_fav__state.dart';

class UserFavCubit extends Cubit<UserFavState> {
  UserFavCubit() : super(UserFavInitial());

  FavouriteMoviesApi favApi = FavouriteMoviesApi();

  List<FavouriteMovie>? favMovies;
  String? errorMessage;
  Future<void> getFavMovies() async {
    try {
      emit(FavMoviesLoading());
      final movies = await favApi.getFavouriteMovieList();

      if (movies != null && movies.isNotEmpty) {
        favMovies = movies;
        emit(FavMoviesSuccess());
      } else {
        emit(FavMoviesError(errorMessage: "No favorite movies found"));
      }
    } catch (e) {
      emit(FavMoviesError(errorMessage: e.toString()));
    }
  }


}
