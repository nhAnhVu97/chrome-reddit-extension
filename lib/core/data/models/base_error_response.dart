import 'package:json_annotation/json_annotation.dart';
part 'base_error_response.g.dart';

@JsonSerializable()
class BaseErrorResponse {
  int statusCode;
  String message;

  BaseErrorResponse({
    this.statusCode = -1,
    this.message = "Internal server error",
  });

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json["message"] is List) {
      json["message"] = (json["message"] as List).first.toString();
    }
    return _$BaseErrorResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseErrorResponseToJson(this);
}
