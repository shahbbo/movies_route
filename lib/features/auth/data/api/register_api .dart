import 'dart:convert';
import 'package:flutter_projects/core/resources/string_manager.dart';
import 'package:flutter_projects/features/auth/data/model/registerDM.dart';
import 'package:http/http.dart' as http;

import '../../../../core/helpers/local/cache_helper.dart';

class RegisterApiService {
  RegisterApiService();

  Future<User> register({
    required String endpoint,
    required Data userData,
  }) async {
    Uri uri = Uri.parse('${AppStrings.baseUrl}$endpoint');
    http.Response response = await http.post(
      uri,
      body: jsonEncode(userData.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to register: ${response.body}");
    }
  }
}
