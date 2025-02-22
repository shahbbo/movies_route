 import 'dart:convert';

import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/string_manager.dart';

class EditProfileApi {
  Future<Map<String, dynamic>> deleteAccount(
    String endPoint,
  ) async {
    Uri url = Uri.parse('${AppStrings.baseUrl}$endPoint');
    String token = CacheHelper.getData(key: 'Token');
    try {
      var response = await http.delete(
          url, headers: {
        'Authorization': 'Bearer $token',
      });
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {'success': true, 'message': '${responseBody['message']}'};
      } else {
        return {
          'success': false,
          'message': 'Delete failed: ${responseBody['message']}'
        };
      }
    } catch (e) {
      print('Delete failed: $e');
      return {'success': false, 'message': 'Operation error.'};
    }
  }
  Future<Map<String, dynamic>> updateData(
      String endPoint, Map<String, dynamic> data) async {
    Uri url = Uri.parse('${AppStrings.baseUrl}$endPoint');
    String token = CacheHelper.getData(key: 'Token');
    print('data to update: $data');
    try {
      var response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {'success': true, 'message': '${responseBody['message']}'};
      } else {
        return {
          'success': false,
          'message': '${responseBody['message']}'
        };
      }
    } catch (e) {
      print('Update failed: $e');
      return {'success': false, 'message': 'Operation error.'};
    }
  }
}
