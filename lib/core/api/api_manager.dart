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
        return {'success': true, 'message': 'Account deleted successfully!'};
      } else {
        return {
          'success': false,
          'message': 'Delete failed: ${response.statusCode}'
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
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Update successful!'};
      } else {
        return {
          'success': false,
          'message': 'Update failed: ${response.statusCode}'
        };
      }
    } catch (e) {
      print('Update failed: $e');
      return {'success': false, 'message': 'Operation error.'};
    }
  }
}
