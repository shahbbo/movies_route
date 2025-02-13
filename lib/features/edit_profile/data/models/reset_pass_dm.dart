class ResetPasswordDM {
  String? message;
  List<String>? errors;
  String? errorType;
  int? statusCode;

  ResetPasswordDM({this.message, this.errors, this.errorType, this.statusCode});

  factory ResetPasswordDM.fromJson(Map<String, dynamic> json) {
    return ResetPasswordDM(
      message: json["message"] is String ? json["message"] : null,
      errors:
          json["message"] is List ? List<String>.from(json["message"]) : null,
      errorType: json["error"],
      statusCode: json["statusCode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message ?? errors,
      "error": errorType,
      "statusCode": statusCode,
    };
  }
}
