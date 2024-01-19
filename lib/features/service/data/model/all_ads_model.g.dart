// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAdsModel _$AllAdsModelFromJson(Map<String, dynamic> json) => AllAdsModel(
      status: json['status'] as bool,
      code: json['status_code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AllAdsEntity.fromJson(json['data'] as Map<String, dynamic>),
    );
