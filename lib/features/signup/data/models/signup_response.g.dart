// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SignupUserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      codeStatus: (json['codeStatus'] as num?)?.toInt(),
    );

SignupUserData _$SignupUserDataFromJson(Map<String, dynamic> json) =>
    SignupUserData(
      token: json['token'] as String?,
      userName: json['username'] as String?,
    );
