// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsEntity _$AboutUsEntityFromJson(Map<String, dynamic> json) =>
    AboutUsEntity(
      appData: AppData.fromJson(json['app_data'] as Map<String, dynamic>),
      socialMedia: json['social_media'] == null
          ? null
          : SocialMediaData.fromJson(
              json['social_media'] as Map<String, dynamic>),
    );

SocialMediaData _$SocialMediaDataFromJson(Map<String, dynamic> json) =>
    SocialMediaData(
      facebook: json['facebook_link'] as String?,
      youtube: json['youtube'] as String?,
      instagram: json['instagram_link'] as String?,
      tiktok: json['tiktok'] as String?,
      whatsapp: json['whatsapp'] as String?,
      twitter: json['twitter_link'] as String?,
    );

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData(
      aboutUs: json['about_us'] as String?,
      policy: json['policy'] as String?,
      terms: json['terms'] as String?,
    );
