class FavouriteMovie {
  final String movieId;
  final String name;
  final double rating;
  final String imageUrl;
  final String year;

  FavouriteMovie({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.year,
  });

  factory FavouriteMovie.fromJson(Map<String, dynamic> json) {
    return FavouriteMovie(
      movieId: json['movieId'],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageURL'],
      year: json['year'],
    );
  }
}
