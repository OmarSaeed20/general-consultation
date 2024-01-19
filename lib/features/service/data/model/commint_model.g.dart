// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommintModel _$CommintModelFromJson(Map<String, dynamic> json) => CommintModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CommintEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
