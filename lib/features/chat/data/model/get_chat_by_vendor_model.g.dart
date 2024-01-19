// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_by_vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatByVendorModel _$GetChatByVendorModelFromJson(
        Map<String, dynamic> json) =>
    GetChatByVendorModel(
      code: json['status_code'] as int,
      data: json['data'] == null
          ? null
          : GetChatByVendorEntity.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as bool,
    );
