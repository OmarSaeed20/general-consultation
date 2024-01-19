// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_vendors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllVendorModel _$AllVendorModelFromJson(Map<String, dynamic> json) =>
    AllVendorModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AllVendorEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
