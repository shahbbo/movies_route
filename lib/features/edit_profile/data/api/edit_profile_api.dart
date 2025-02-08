import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/string_manager.dart';

class EditProfileApi {
  Future<Map<String, dynamic>> deleteAccount(
    String endPoint,
  ) async {
    Uri url = Uri.parse('${AppStrings.baseUrl}$endPoint');
    try {
      print('Token: $token');
      print('URL: $url');
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
    try {
      print('data: ${jsonEncode(data)}');
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
