class FavoriteMoviesDm {
  String? message;
  int? statusCode;
  List<FavoritesData>? data;
  String? token;

  FavoriteMoviesDm({
    this.message,
    this.statusCode,
    this.data,
    this.token,
  });

  factory FavoriteMoviesDm.fromJson(Map<String, dynamic> json) {
    return FavoriteMoviesDm(
      message: json["message"],
      token: json["token"],
      statusCode: json["statusCode"],
      data: _parseFavoritesData(json["data"]),
    );
  }

  static List<FavoritesData>? _parseFavoritesData(dynamic jsonData) {
    if (jsonData == null) return null;
    if (jsonData is List) {
      return jsonData.map((e) => FavoritesData.fromJson(e)).toList();
    }
    return null;
  }
}

class FavoritesData {
  num? movieId;
  String? name;
  double? rating;
  String? imageUrl;
  String? year;
  final bool isFavorite;

  FavoritesData({
    this.movieId,
    this.name,
    this.rating,
    this.imageUrl,
    this.year,
    this.isFavorite = false,
  });

  factory FavoritesData.fromJson(Map<String, dynamic> json) {
    return FavoritesData(
      movieId: json["movieId"] is num
          ? json["movieId"]
          : num.tryParse(json["movieId"].toString()),
      name: json["name"],
      rating: (json["rating"] as num?)?.toDouble(),
      imageUrl: json["imageURL"],
      year: json["year"],
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imageUrl,
      "year": year,
    };
  }
}
