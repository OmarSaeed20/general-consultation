import '/index.dart';

part 'all_vendors_entity.g.dart';

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class AllVendorEntity extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  final List<VendorEntity> vendors;

  const AllVendorEntity({required this.meta, required this.vendors});

  factory AllVendorEntity.fromJson(Map<String, dynamic> json) =>
      _$AllVendorEntityFromJson(json);

  @override
  List<Object?> get props => [meta, vendors];
}
