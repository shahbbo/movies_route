import 'dart:convert';

import 'package:flutter_projects/core/api/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiManager{

  Future<Map<String, dynamic>> deleteAccount(String endPoint) async {
    Uri url = Uri.https(ApiConstants.baseUrl, endPoint);
    try {
      var response = await http.delete(url);

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Account deleted successfully!'};
      } else {
        return {'success': false, 'message': 'Delete failed: ${response.statusCode}'};
      }
    } catch (e) {
      print('Delete failed: $e');
      return {'success': false, 'message': 'Operation error.'};
    }
  }

  Future<Map<String, dynamic>> updateData(String endPoint, Map<String, String> data) async {
    Uri url = Uri.https(ApiConstants.baseUrl, endPoint);
    try {
      var response = await http.patch(
        url,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Update successful!'};
      } else {
        return {'success': false, 'message': 'Update failed: ${response.statusCode}'};
      }
    } catch (e) {
      print('Update failed: $e');
      return {'success': false, 'message': 'Operation error.'};
    }
  }}