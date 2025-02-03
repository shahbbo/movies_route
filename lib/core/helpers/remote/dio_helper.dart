import 'package:dio/dio.dart';

import '../../resources/constants.dart';
import '../../resources/string_manager.dart';
import '../local/cache_helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppStrings.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getDate({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    token = CacheHelper.getData(key: 'TokenId');
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
  }) async {
    token = CacheHelper.getData(key: 'TokenId');
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required dynamic data,
      String tokenVerify = ''}) async {
    token = CacheHelper.getData(key: 'TokenId');
    dio.options.headers = {
      'Authorization': 'Bearer ${tokenVerify.isEmpty ? token : tokenVerify}',
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    dynamic data,
  }) async {
    token = CacheHelper.getData(key: 'TokenId');
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return dio.delete(
      url,
      data: data,
    );
  }

  static Future<Response> patchData(
      {required String url,
      Map<String, dynamic>? query,
      required dynamic data,
      String tokenVerify = ''}) async {
    token = CacheHelper.getData(key: 'TokenId');
    dio.options.headers = {
      'Authorization': 'Bearer ${tokenVerify.isEmpty ? token : tokenVerify}',
    };
    return dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
