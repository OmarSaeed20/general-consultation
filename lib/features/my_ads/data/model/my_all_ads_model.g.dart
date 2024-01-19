// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_all_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAllAdsModel _$MyAllAdsModelFromJson(Map<String, dynamic> json) =>
    MyAllAdsModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MyAllAdsEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
