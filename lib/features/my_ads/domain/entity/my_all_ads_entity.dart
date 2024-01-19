import '/index.dart';

part 'my_all_ads_entity.g.dart';

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class MyAllAdsEntity extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  final List<MyAdsEntity> ads;

  const MyAllAdsEntity({required this.meta, required this.ads});

  factory MyAllAdsEntity.fromJson(Map<String, dynamic> json) =>
      _$MyAllAdsEntityFromJson(json);

  @override
  List<Object?> get props => [meta, ads];
}

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class MyAdsEntity extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "user")
  final UserData? user;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "file")
  final String? file;
  @JsonKey(name: "video_link")
  final String? videoLink;
  @JsonKey(name: "created_at")
  final String createdAt;

  const MyAdsEntity({
    required this.id,
    required this.categoryId,
    required this.user,
    required this.description,
    required this.file,
    required this.videoLink,
    required this.createdAt,
  });

  factory MyAdsEntity.fromJson(Map<String, dynamic> json) =>
      _$MyAdsEntityFromJson(json);

  @override
  List<Object?> get props =>
      [id, categoryId, user, file, description, videoLink, createdAt];
}

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class UserData extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "image")
  final String image;

  const UserData({required this.id, required this.image, required this.name});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @override
  List<Object> get props => [id, image, name];
}
