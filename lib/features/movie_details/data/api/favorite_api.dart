import 'dart:convert';

import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/core/resources/string_manager.dart';
import 'package:flutter_projects/features/movie_details/data/model/favorite_movies_dm.dart';
import 'package:http/http.dart' as http;

class FavoriteApi {
  Future<List<FavoritesData>?> getFavoriteMovies() async {
    try {
      String? token = CacheHelper.getData(key: 'Token');
      if (token == null) {
        print("Error: No token found");
        return null;
      }

      Uri url =
          Uri.parse('${AppStrings.baseUrl}${ApiEndPoints.getAllFavMOvies}');
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final favoriteMoviesDm = FavoriteMoviesDm.fromJson(responseBody);
        return favoriteMoviesDm.data; // Return the list of FavoritesData
      } else {
        throw Exception("Failed to load favorite movies");
      }
    } catch (e) {
      print("Error fetching favorite movies: ${e.toString()}");
      return null;
    }
  }

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

  Future<bool> removeFavoriteMovie(String movieId) async {
    final url =
        Uri.parse('${AppStrings.baseUrl}${ApiEndPoints.removeMovies}$movieId');
    String? token = CacheHelper.getData(key: 'Token');

    if (token == null) {
      print("Error: No token found");
    }
    try {
      final response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return true; // Movie successfully removed
      } else {
        final errorResponse = jsonDecode(response.body);
        throw Exception(errorResponse['message'] ?? 'Failed to remove movie');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
