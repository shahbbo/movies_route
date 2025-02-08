class UserLogin {
  String? message;
  String? data;
  String? error;
  int? statusCode;
  String? email;
  String? password;
  UserLogin(
      {this.message,
      this.data,
      this.error,
      this.statusCode,
      this.email,
      this.password});

  UserLogin.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"];
    error = json["error"];
    statusCode = json["statusCode"];
    email = json["email"];
    password = json["password"];
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
    _data["email"] = email;
    _data["password"] = password;
    return _data;
  }
}
