// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_all_ads_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAllAdsEntity _$MyAllAdsEntityFromJson(Map<String, dynamic> json) =>
    MyAllAdsEntity(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      ads: (json['data'] as List<dynamic>)
          .map((e) => MyAdsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MyAdsEntity _$MyAdsEntityFromJson(Map<String, dynamic> json) => MyAdsEntity(
      id: json['id'] as int,
      categoryId: json['category_id'] as int?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      description: json['description'] as String,
      file: json['file'] as String?,
      videoLink: json['video_link'] as String?,
      createdAt: json['created_at'] as String,
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
    );
