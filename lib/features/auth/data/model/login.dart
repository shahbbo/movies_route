class UserLogin {
  String? message;
  String? data;
  String? error;
  int? statusCode;

  UserLogin({this.message, this.data, this.error, this.statusCode});

  UserLogin.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"];
    error = json["error"];
    statusCode = json["statusCode"];
  }

  static List<UserLogin> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserLogin.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["data"] = data;
    _data["error"] = error;
    _data["statusCode"] = statusCode;
    return _data;
  }
}
