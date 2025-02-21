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
  List <FavouriteMovie> favList = [];

  Future<List<FavouriteMovie>> getFavouriteMovieList() async {
    try {
      String? token = CacheHelper.getData(key: 'Token');
      if (token == null) {
        throw Exception("No token found");
      }

      Uri url = Uri.parse('${AppStrings.baseUrl}${ApiEndPoints.getAllFavMOvies}');
      final response = await http.get(url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final bodyList = json.decode(response.body) as Map<String, dynamic>;
        if (bodyList.containsKey('data')) {
          favList = (bodyList['data'] as List)
              .map((item) => FavouriteMovie.fromJson(item))
              .toList();
        } else {
          throw Exception("No 'data' key in response");
        }
        return favList;
      } else {
        throw Exception("Failed to load favorite movies. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching favorite movies");
    }
  }


}
