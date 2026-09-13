import 'package:json_annotation/json_annotation.dart';
part 'failure_model.g.dart';

@JsonSerializable()
class FailureModel {
  final int statusCode;
  final dynamic error;
  const FailureModel({required this.statusCode, required this.error});
  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(statusCode: json["statusCode"]??0, error: json["error"]);
  }
  @override
  String toString() => error.join("\n");
}
