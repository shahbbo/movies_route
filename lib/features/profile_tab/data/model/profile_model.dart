import 'dart:convert';

class Profile {
   final String id;
   final String email;
   final String password;
   final String name;
   final String phone;
   final int avatarId;
   final DateTime createdAt;
   final DateTime updatedAt;

  Profile({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avatarId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      avatarId: json['avaterId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'avaterId': avatarId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
  static Profile fromJsonString(String jsonString) {
    return Profile.fromJson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}