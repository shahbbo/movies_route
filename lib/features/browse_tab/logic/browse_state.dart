part of 'browse_cubit.dart';


@immutable
sealed class BrowseState {}

final class BrowseInitial extends BrowseState {}

final class BrowseSelectedCategory extends BrowseState {}
final class BrowseLoading extends BrowseState {}

final class BrowseLoaded extends BrowseState {}

final class BrowseError extends BrowseState {
  final String error;
  BrowseError(this.error);
}