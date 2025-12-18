import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String? message;

  @JsonKey(name: 'data')
  final SignupUserData? data;

  final bool? status;
  final int? codeStatus;

  SignupResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.codeStatus,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class SignupUserData {
  final String? token;

  @JsonKey(name: 'username')
  final String? userName;

  SignupUserData({required this.token, required this.userName});

  factory SignupUserData.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDataFromJson(json);
}
