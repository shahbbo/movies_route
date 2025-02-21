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
      var response = await http.delete(
          url, headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjUzMTEzNTA0MDUwNTdhZTg2ZjJmNyIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3NDAwOTA4MzR9.2LWT3f3Qy2-7K8SXWRiTQaGX7Ed_FUUDLlcFIeV9tPo',
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
      var response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjUzMTEzNTA0MDUwNTdhZTg2ZjJmNyIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3NDAwOTA4MzR9.2LWT3f3Qy2-7K8SXWRiTQaGX7Ed_FUUDLlcFIeV9tPo',
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
