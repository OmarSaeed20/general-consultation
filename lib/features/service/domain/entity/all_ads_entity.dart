import '/index.dart';

part 'all_ads_entity.g.dart';

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class AllAdsEntity extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  final List<AdsEntity> ads;

  const AllAdsEntity({required this.meta, required this.ads});

  factory AllAdsEntity.fromJson(Map<String, dynamic> json) =>
      _$AllAdsEntityFromJson(json);

  @override
  List<Object?> get props => [meta, ads];
}

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class AdsEntity extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "user")
  final VendorEntity? vendor;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "file")
  final String? file;
  @JsonKey(name: "video_link")
  final String? videoLink;
  @JsonKey(name: "created_at")
  final String createdAt;

  const AdsEntity({
    required this.id,
    required this.categoryId,
    required this.vendor,
    required this.description,
    required this.file,
    required this.videoLink,
    required this.createdAt,
  });

  factory AdsEntity.fromJson(Map<String, dynamic> json) =>
      _$AdsEntityFromJson(json);

  @override
  List<Object?> get props =>
      [id, categoryId, vendor, file, description, videoLink, createdAt];
}
