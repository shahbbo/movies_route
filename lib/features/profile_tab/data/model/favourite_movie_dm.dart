class FavoriteMovie {
  final int id;
  final String title;
  final String posterPath;
  final double rating;

  FavoriteMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
  });

  factory FavoriteMovie.fromJson(Map<String, dynamic> json) {
    return FavoriteMovie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
      rating: (json['vote_average'] as num).toDouble(),
    );
  }
}

class FavoriteMoviesResponse {
  final bool status;
  final String message;
  final List<FavoriteMovie> movies;

  FavoriteMoviesResponse({
    required this.status,
    required this.message,
    required this.movies,
  });

  factory FavoriteMoviesResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteMoviesResponse(
      status: json['status'],
      message: json['message'],
      movies: (json['data'] as List)
          .map((movie) => FavoriteMovie.fromJson(movie))
          .toList(),
    );
  }
}
