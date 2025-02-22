
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/helpers/local/cache_helper.dart';
import '../model/profile_model.dart';
import'package:http/http.dart' as http;

abstract class ProfileRepo {
  Future<Either<Failure, Profile>> getProfile();
}

class ProfileRepoImplementation implements ProfileRepo {
  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      String? token = CacheHelper.getData(key: 'Token');
      final response = await http.get(
        Uri.parse("https://route-movie-apis.vercel.app/profile"),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody.containsKey("data")) {
          final profileModel = Profile.fromJson(responseBody["data"]);
          await CacheHelper.saveData(key: 'userId', value: profileModel.id);
          return right(profileModel);
        } else {
          return left(ApiFailure(message: responseBody["message"] ?? "Failed to fetch profile"));
        }
      } else if (response.statusCode == 401) {
        return left(ApiFailure(message: "Unauthorized: Please login again."));
      } else {
        return left(ApiFailure(message: "Failed to fetch data, Status code: ${response.statusCode}"));
      }
    } on SocketException {
      return left(NoInternetFailure(message: "No Internet Connection"));
    } on FormatException {
      return left(ApiFailure(message: "Invalid response format"));
    } catch (e) {
      return left(ApiFailure(message: "An unexpected error occurred"));
    }
  }
}
