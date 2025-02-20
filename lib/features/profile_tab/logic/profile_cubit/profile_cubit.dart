import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../data/Api/Api_profile-Tab.dart';
import '../../data/model/profile_model.dart';
import '../profile_state/profile_state.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final Either<Failure, Profile> result = await profileRepo.getProfile();
    result.fold(
          (failure) => emit(ProfileError(failure.message)),
          (profile) => emit(ProfileLoaded(profile)),
    );
  }
}
