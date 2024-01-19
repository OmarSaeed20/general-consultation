// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_ads_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAdsEntity _$AllAdsEntityFromJson(Map<String, dynamic> json) => AllAdsEntity(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      ads: (json['data'] as List<dynamic>)
          .map((e) => AdsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

AdsEntity _$AdsEntityFromJson(Map<String, dynamic> json) => AdsEntity(
      id: json['id'] as int,
      categoryId: json['category_id'] as int?,
      vendor: json['user'] == null
          ? null
          : VendorEntity.fromJson(json['user'] as Map<String, dynamic>),
      description: json['description'] as String,
      file: json['file'] as String?,
      videoLink: json['video_link'] as String?,
      createdAt: json['created_at'] as String,
    );
