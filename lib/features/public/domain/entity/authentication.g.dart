// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationEntity _$AuthenticationEntityFromJson(
        Map<String, dynamic> json) =>
    AuthenticationEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      codeCountry: json['code_country'] as String,
      phone: json['mobile'] as String,
      emailVerifiedAt: json['email_verified_at'] as bool,
      phoneVerifiedAt: json['mobile_verified_at'] as bool,
      type: json['type'] as String,
      token: json['token'] as String,
      blockNotification: json['block_notification'] as bool,
    );
