import 'dart:convert';

import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/core/resources/string_manager.dart';
import 'package:flutter_projects/features/movie_details/data/model/favorite_movies_dm.dart';
import 'package:http/http.dart' as http;

class FavoriteApi {
  /* Future<List<FavoriteMoviesDm>> getFavorite() async {
    Uri url = Uri.parse('${AppStrings.baseUrl}${ApiEndPoints.favMovies}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<FavoriteMoviesDm> movies =
          data.map((movie) => FavoriteMoviesDm.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }*/

  Future<FavoriteMoviesDm?> addFavoriteMovie(FavoritesData movie) async {
    Uri url = Uri.parse('${AppStrings.baseUrl}${ApiEndPoints.favMovies}');

    String? token = CacheHelper.getData(key: 'Token');

    if (token == null) {
      print("Error: No token found");
      return null;
    }

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(movie.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return FavoriteMoviesDm.fromJson(jsonDecode(response.body));
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
