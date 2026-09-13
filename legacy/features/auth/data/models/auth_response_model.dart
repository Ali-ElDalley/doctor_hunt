import 'package:json_annotation/json_annotation.dart';
part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final int statusCode;
  final String message;
  final String? alert;
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "refresh_token")
  final String? refreshToken;
  final UserModel user;
  AuthResponseModel({
    required this.statusCode,
    required this.message,
    required this.alert,
    required this.user,
    this.accessToken,
    this.refreshToken,
  });
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      statusCode: json["statusCode"],
      message: json["message"],
      alert: json["alert"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}

@JsonSerializable()
class UserModel {
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String phone;
  @JsonKey(name: "image_path")
  final String imagePath;
  @JsonKey(name: "is_verified")
  final String isVerified;
 @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "refresh_token")
  final String? refreshToken;
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imagePath,
    required this.isVerified, this.accessToken, this.refreshToken,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phone: json["phone"],
      imagePath: json["image_path"],
      isVerified: json["is_verified"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}
