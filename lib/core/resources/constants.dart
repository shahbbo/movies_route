import '../helpers/local/cache_helper.dart';

String? token = CacheHelper.getData(key: 'Token');

String? uid = CacheHelper.getData(key: 'ID');

bool? language = CacheHelper.getData(key: 'LOCALE');

bool? onBoarding = CacheHelper.getData(key: 'OnBoarding');

bool? emailVerified = CacheHelper.getData(key: 'emailVerified');


void getAllCached() {
  token = CacheHelper.getData(key: 'Token');
  uid = CacheHelper.getData(key: 'ID');
  language = CacheHelper.getData(key: 'LOCALE');
  onBoarding = CacheHelper.getData(key: 'OnBoarding');
  emailVerified = CacheHelper.getData(key: 'emailVerified');
}
