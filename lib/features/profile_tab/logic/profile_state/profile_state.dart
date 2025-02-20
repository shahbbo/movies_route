

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