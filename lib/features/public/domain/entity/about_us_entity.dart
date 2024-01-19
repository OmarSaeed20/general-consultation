import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'about_us_entity.g.dart';

@JsonSerializable(createToJson: false)
class AboutUsEntity extends Equatable {
  const AboutUsEntity({required this.appData, required this.socialMedia});
  @JsonKey(name: "app_data")
  final AppData appData;
  @JsonKey(name: "social_media")
  final SocialMediaData? socialMedia;
  factory AboutUsEntity.fromJson(Map<String, dynamic> json) =>
      _$AboutUsEntityFromJson(json);
  @override
  List<Object?> get props => [appData, socialMedia];
}

@JsonSerializable(createToJson: false)
class SocialMediaData extends Equatable {
  const SocialMediaData({
    required this.facebook,
    required this.youtube,
    required this.instagram,
    required this.tiktok,
    required this.whatsapp,
    required this.twitter,
  });
  @JsonKey(name: "facebook_link")
  final String? facebook;
  @JsonKey(name: "twitter_link")
  final String? twitter;
  @JsonKey(name: "tiktok")
  final String? tiktok;
  @JsonKey(name: "instagram_link")
  final String? instagram;
  @JsonKey(name: "whatsapp")
  final String? whatsapp;
  @JsonKey(name: "youtube")
  final String? youtube;

  factory SocialMediaData.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaDataFromJson(json);
  @override
  List<Object?> get props =>
      [facebook, tiktok, instagram, twitter, whatsapp, youtube];
}

@JsonSerializable(createToJson: false)
class AppData extends Equatable {
  const AppData({
    required this.aboutUs,
    required this.policy,
    required this.terms,
  });
  @JsonKey(name: "about_us")
  final String? aboutUs;
  @JsonKey(name: "policy")
  final String? policy;
  @JsonKey(name: "terms")
  final String? terms;

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);
  @override
  List<Object?> get props => [terms, policy, aboutUs];
}
