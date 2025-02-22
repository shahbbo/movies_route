

import '../../../home_tab/data/model/MoviesListModel.dart';
import '../../data/model/profile_model.dart';

abstract class ProfileState  {
  const ProfileState();

}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;
  ProfileLoaded(this.profile);

}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

}

class ProfileLoadedHistory extends ProfileState {
  final List<Movies> moviesHistory;

  ProfileLoadedHistory(this.moviesHistory);

}