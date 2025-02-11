class FavoriteMoviesDm {
  String? message;
  int? statusCode;
  FavoritesData? data;

  FavoriteMoviesDm({this.message, this.statusCode, this.data});

  FavoriteMoviesDm.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
    data = json["data"] == null ? null : FavoritesData.fromJson(json["data"]);
  }

  static List<FavoriteMoviesDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(FavoriteMoviesDm.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusCode"] = statusCode;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class FavoritesData {
  String? movieId;
  String? name;
  double? rating;
  String? imageUrl;
  String? year;

  FavoritesData(
      {this.movieId, this.name, this.rating, this.imageUrl, this.year});

  FavoritesData.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    name = json["name"];
    rating = json["rating"];
    imageUrl = json["imageURL"];
    year = json["year"];
  }

  static List<FavoritesData> fromList(List<Map<String, dynamic>> list) {
    return list.map(FavoritesData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["movieId"] = movieId;
    _data["name"] = name;
    _data["rating"] = rating;
    _data["imageURL"] = imageUrl;
    _data["year"] = year;
    return _data;
  }
}
