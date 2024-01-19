// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : NotificationEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
