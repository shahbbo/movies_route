import 'dart:convert';

import 'package:flutter_projects/core/api/api_constants.dart';
import 'package:flutter_projects/core/api/api_endPoints.dart';

import 'package:http/http.dart' as http;

import '../../../home_tab/data/model/MoviesListModel.dart';
class MovieSuggestionsApi{


  MoviesListModel  movieSuggestions = MoviesListModel();
  Future<MoviesListModel> getSuggestions(num movieId) async {
    Uri url = Uri.parse('${ApiConstants.movieUrl}${ApiEndPoints.movieSuggetions}?movie_id=$movieId');

    final response = await http.get(url);

    final jsonResponse = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        movieSuggestions = MoviesListModel.fromJson(jsonResponse);
        return movieSuggestions;
      } else {
        throw Exception("Failed to load data : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data");
    }

  }

}