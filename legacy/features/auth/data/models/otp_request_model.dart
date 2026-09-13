import 'package:dio/dio.dart';

class OtpRequestModel {
  final String email;
  final String code;
  OtpRequestModel({required this.email, required this.code});
  Map<String, dynamic> toJson()  {
    return {"email": email, "code": code};
  }
  FormData toFormData()  {
  return  FormData.fromMap(toJson());
  }
}
