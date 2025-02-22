class ResetPasswordDM {
  String? message;
  List<String>? errors;
  String? errorType;
  int? statusCode;
  String? oldPassword;
  String? newPassword;

  ResetPasswordDM({
    this.message,
    this.errors,
    this.errorType,
    this.statusCode,
    this.oldPassword,
    this.newPassword,
  });

  factory ResetPasswordDM.fromJson(Map<String, dynamic> json) {
    return ResetPasswordDM(
      message: json["message"] is String ? json["message"] : null,
      errors:
          json["message"] is List ? List<String>.from(json["message"]) : null,
      errorType: json["error"],
      statusCode: json["statusCode"],
      oldPassword: json["oldPassword"], //
      newPassword: json["newPassword"], //
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message ?? errors,
      "error": errorType,
      "statusCode": statusCode,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };
  }
}
