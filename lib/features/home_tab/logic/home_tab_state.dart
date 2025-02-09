part of 'home_tab_cubit.dart';

@immutable
sealed class HomeTabState {}

final class HomeTabInitial extends HomeTabState {}

final class HomeTabLoading extends HomeTabState {}

final class HomeTabLoaded extends HomeTabState {}

final class HomeTabError extends HomeTabState {
  final String error;

  HomeTabError(this.error);
}

final class HomeBackgroundImageState extends HomeTabState {}
