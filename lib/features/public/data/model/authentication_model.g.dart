// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AuthenticationEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

ContactUsModel _$ContactUsModelFromJson(Map<String, dynamic> json) =>
    ContactUsModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'],
    );
