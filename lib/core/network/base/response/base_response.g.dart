// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) =>
    BaseResponse<T>(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: DataConverter<T?>().fromJson(json['data']),
    );
