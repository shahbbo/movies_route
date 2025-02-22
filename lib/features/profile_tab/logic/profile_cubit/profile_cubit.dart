import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/helpers/local/cache_helper.dart';
import '../../../home_tab/data/model/MoviesListModel.dart';
import '../../data/Api/Api_profile-Tab.dart';
import '../../data/model/profile_model.dart';
import '../profile_state/profile_state.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  static ProfileCubit of(context) => BlocProvider.of(context);

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());


  Profile? profile;
  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final Either<Failure, Profile> result = await profileRepo.getProfile();
    result.fold(
          (failure) {
        emit(ProfileError(failure.message));
      },
          (profile) {
        this.profile = profile;
        loadHistoryMovies();
        emit(ProfileLoaded(profile));
      },
    );
  }


  List<Movies> moviesHistory = [];

  void loadHistoryMovies() async {
    String? userId = await CacheHelper.getData(key: 'userId');
    if (userId == null) return;
    var historyBox = await Hive.openBox('history_$userId');
    List<Movies> loadedMovies = historyBox.values.map((movieData) {
      return Movies(
        title: movieData['title'] ?? 'Unknown',
        rating: movieData['rating'] ?? 0.0,
        largeCoverImage: movieData['large_cover_image'] ?? '',
        id: movieData['id'] ?? 0,
      );
    }).toList();
      moviesHistory = loadedMovies;
    emit(ProfileLoadedHistory(moviesHistory));
  }
}
