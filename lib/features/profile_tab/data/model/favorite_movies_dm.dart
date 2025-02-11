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

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "token": token,
      "statusCode": statusCode,
      "data": data?.map((e) => e.toJson()).toList(),
    };
  }

  static List<FavoritesData>? _parseFavoritesData(dynamic jsonData) {
    if (jsonData == null) return null;
    if (jsonData is List) {
      return jsonData.map((e) => FavoritesData.fromJson(e)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      return [FavoritesData.fromJson(jsonData)];
    }
    return null;
  }
}

class FavoritesData {
  String? movieId;
  String? name;
  double? rating;
  String? imageUrl;
  String? year;

  FavoritesData({
    this.movieId,
    this.name,
    this.rating,
    this.imageUrl,
    this.year,
  });

  factory FavoritesData.fromJson(Map<String, dynamic> json) {
    return FavoritesData(
      movieId: json["movieId"],
      name: json["name"],
      rating: (json["rating"] as num?)?.toDouble(),
      imageUrl: json["imageURL"],
      year: json["year"],
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
