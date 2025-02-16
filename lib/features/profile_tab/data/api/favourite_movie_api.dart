import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/api/api_endPoints.dart';
import '../../../../core/helpers/local/cache_helper.dart';
import '../../../../core/resources/string_manager.dart';
import '../model/favourite_movie_dm.dart';

class FavouriteMoviesApi {
  /*
https://route-movie-apis.vercel.app/favorites/all
  */
  Future<List<FavouriteMovie>?> getFavouriteMovieList() async {
    try {
      String? token = CacheHelper.getData(key: 'Token');
      print('token : $token');
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
        },
      );

      if (response.statusCode == 200) {
        final Map<String ,dynamic> bodyList = json.decode(response.body);
        final List<FavouriteMovie> movies = bodyList['data'].map<FavouriteMovie>((e) => FavouriteMovie.fromJson(e)).toList();

        print("******************");
        print("Movies List: $movies");
        print("******************");
        print("Status Code: ${response.statusCode}");
        print("******************");
        print(" Raw Response: ${response.body}");
        print("******************");
        print(" Token: $token");

        return movies; // Return the list of FavouriteMovie
      } else {
        throw Exception("Failed to load favorite movies");
      }
    } catch (e) {
      print("Error fetching favorite movies: ${e.toString()}");
      return null;
    }
  }
}
