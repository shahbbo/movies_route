import '../helpers/local/cache_helper.dart';

String? token = CacheHelper.getData(key: 'TokenId');

String? uid = CacheHelper.getData(key: 'ID');

bool? language = CacheHelper.getData(key: 'Language');

bool? onBoarding = CacheHelper.getData(key: 'OnBoarding');

bool? emailVerified = CacheHelper.getData(key: 'emailVerified');


void getAllCached() {
  token = CacheHelper.getData(key: 'TokenId');
  uid = CacheHelper.getData(key: 'ID');
  language = CacheHelper.getData(key: 'Language');
  onBoarding = CacheHelper.getData(key: 'OnBoarding');
  emailVerified = CacheHelper.getData(key: 'emailVerified');
}
