import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/failure/failure.dart';
import '../../data/Api/Api_profile-Tab.dart';
import '../../data/model/profile_model.dart';
import '../profile_state/profile_state.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  static ProfileCubit of(context) => BlocProvider.of(context);

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    print("Fetching profile...");

    final Either<Failure, Profile> result = await profileRepo.getProfile();

    result.fold(
          (failure) {
        print("Profile fetch failed: ${failure.message}");
        emit(ProfileError(failure.message));
      },
          (profile) {
        print("Profile fetch successful: ${profile.name}");
        emit(ProfileLoaded(profile));
      },
    );
  }

}
