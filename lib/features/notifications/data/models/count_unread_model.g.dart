// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_unread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountUnreadModel _$CountUnreadModelFromJson(Map<String, dynamic> json) =>
    CountUnreadModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CountUnreadEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
