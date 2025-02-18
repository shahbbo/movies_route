part of 'user_fav__cubit.dart';

@immutable
sealed class UserFavState {}

final class UserFavInitial extends UserFavState {}


final class FavMoviesLoading extends UserFavState {}
final class FavMoviesSuccess extends UserFavState {}
final class FavMoviesError extends UserFavState {
  String errorMessage;
  FavMoviesError({required this.errorMessage});
}


