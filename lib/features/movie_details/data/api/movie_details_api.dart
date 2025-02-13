import 'dart:convert';

import 'package:flutter_projects/features/movie_details/data/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class MovieDetailsApi {


  MovieModel  movieDetails = MovieModel();
  Movie  movie = Movie();

  Future<MovieModel> getMovieDetails(num movieId) async {
    Uri url = Uri.parse('https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true');
    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        movieDetails = MovieModel.fromJson(jsonResponse);
        return movieDetails;
      } else {
        throw Exception("Failed to load data : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data");
    }
  }

}