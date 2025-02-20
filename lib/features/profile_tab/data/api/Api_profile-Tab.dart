
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/failure/failure.dart';
import '../model/profile_model.dart';
import'package:http/http.dart' as http;

abstract class ProfileRepo {
  Future<Either<Failure, Profile>> getProfile();
}

class ProfileRepoImplementation implements ProfileRepo {
  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final response = await http.get(
        Uri.parse("https://route-movie-apis.vercel.app/profile"),
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY0YzczNjgxZWQxZWE0MjRkMmNlMyIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3Mzk3NDA0MjR9.QNKPYPv4LtEAIsEp5dKFetfrwlXw7LbKQAzyLIBF3Kg",
        },
      );

      debugPrint("Response Status: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody["status"] == true) {
          final profileModel = Profile.fromJson(responseBody["data"]);
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
      debugPrint('Error occurred: $e');
      return left(ApiFailure(message: "An unexpected error occurred"));
    }
  }
}
