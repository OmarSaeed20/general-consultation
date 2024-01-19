import '/index.dart';

part 'home_entity.g.dart';

@JsonSerializable(createToJson: false)
class HomeEntity extends Equatable {
  @JsonKey(name: "Banners")
  final List<String> banners;
  @JsonKey(name: "count-unread")
  final int countUnread;
  @JsonKey(name: "vendors")
  final VendorHomeData vendors;
  @JsonKey(name: "categories")
  final List<CategoriesEntity> categories;

  const HomeEntity({
    required this.banners,
    required this.categories,
    required this.vendors,
    required this.countUnread,
  });
  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeEntityFromJson(json);
  @override
  List<Object> get props => [countUnread, banners, categories, vendors];
}

@JsonSerializable(
  createToJson: false,
  converters: [DataConverter()],
)
class VendorHomeData extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  final List<VendorEntity> list;

  const VendorHomeData({required this.meta, required this.list});

  factory VendorHomeData.fromJson(Map<String, dynamic> json) =>
      _$VendorHomeDataFromJson(json);

  @override
  List<Object?> get props => [meta, list];
}
