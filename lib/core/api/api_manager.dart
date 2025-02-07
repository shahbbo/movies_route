import 'dart:convert';

import 'package:http/http.dart' as http;

import '../resources/constants.dart';
import '../resources/string_manager.dart';

class ApiManager {
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
      if (response.statusCode == 200) {
        return {'success': true, 'message': '${jsonDecode(response.body)['message']}'};
      } else {
        return {
          'success': false,
          'message': 'Delete failed: ${jsonDecode(response.body)['message']}'
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
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY0YzczNjgxZWQxZWE0MjRkMmNlMyIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3Mzg5NTIzMjh9.hgPU6gZpbkZ1vvSD098SKcAY1921xmoBRkIQWV0IrXE',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return {'success': true, 'message': '${jsonDecode(response.body)['message']}'};
      } else {
        return {
          'success': false,
          'message': 'Update failed: ${jsonDecode(response.body)['message']}'
        };
      }
    } catch (e) {
      print('Update failed: $e');
      return {'success': false, 'message': 'Operation error.'};
    }
  }
}
