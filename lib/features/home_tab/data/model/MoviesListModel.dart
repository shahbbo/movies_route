import 'dart:convert';
MoviesListModel movieModelFromJson(String str) => MoviesListModel.fromJson(json.decode(str));
String movieModelToJson(MoviesListModel data) => json.encode(data.toJson());
Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));
String moviesToJson(Movies data) => json.encode(data.toJson());
class MoviesListModel {
  String? status;
  String? statusMessage;
  Data? data;
  MoviesListModel({
      this.status, 
      this.statusMessage, 
      this.data, 
  });
  MoviesListModel.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
class Data {
  num? movieCount;
  num? limit;
  num? pageNumber;
  List<Movies>? movies;
  Data({
      this.movieCount, 
      this.limit, 
      this.pageNumber, 
      this.movies,});

  Data.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Movies {
  num? id;
  String? title;
  String? titleEnglish;
  String? titleLong;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  String? dateUploaded;
  num? dateUploadedUnix;

  Movies({
      this.id,
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.year,
      this.rating, 
      this.runtime, 
      this.genres,
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.state, 
      this.dateUploaded,
      this.dateUploadedUnix,});
  Movies.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }
}