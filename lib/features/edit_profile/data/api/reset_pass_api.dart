import 'dart:convert';
import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/core/resources/string_manager.dart';
import 'package:flutter_projects/features/edit_profile/data/models/reset_pass_dm.dart';
import 'package:http/http.dart' as http;

class ResetPassApi {
  Future<ResetPasswordDM> resetPassword(
      {required String oldPassword,
      required String newPassword,
      required String token}) async {
    try {
      Uri url = Uri.parse('${AppStrings.baseUrl}${ApiEndPoints.resetPass}');

      final response = await http.patch(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        }),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ResetPasswordDM.fromJson(responseData);
      } else {
        return ResetPasswordDM.fromJson(responseData);
      }
    } catch (e) {
      print("Exception in API Call: $e");
      return ResetPasswordDM(
        message: "An error occurred",
        errors: ["An error occurred: $e"],
      );
    }
  }
}
