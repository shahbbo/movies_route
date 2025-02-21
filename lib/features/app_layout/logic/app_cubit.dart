import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/helpers/local/cache_helper.dart';
import '../../browse_tab/ui/browse_tab.dart';
import '../../home_tab/ui/home_tab.dart';
import '../../profile_tab/ui/profile_tab/profile_tab.dart';
import '../../search_tab/ui/search_tab.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  Locale locale = const Locale('en');
  Future<String> getCachedSavedLanguage() async {
    final String? cachedLanguageCode = await CacheHelper.getData(key: 'LOCALE');
    if (cachedLanguageCode != null) {
      debugPrint('cachedLanguageCode');
      return cachedLanguageCode;
    } else {
      debugPrint('cachedLanguageCodeEn');
      return 'en';
    }
  }
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await getCachedSavedLanguage();
    locale = Locale(cachedLanguageCode);
    Get.updateLocale(locale);
    emit(ChangeLocalState());
  }

  Future<void> cachedLanguageCode(String languageCode) async {
    CacheHelper.saveData(key: 'LOCALE', value: languageCode);
    locale = Locale(languageCode);
    Get.updateLocale(locale);
    emit(ChangeLocalState());
  }

  int currentIndex = 0;

  List<Widget> appTabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];
  void changeBottomNavigationBarIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavigationBarIndexChange());
  }

}
