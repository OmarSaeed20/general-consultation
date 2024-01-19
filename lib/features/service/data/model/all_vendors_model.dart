import '/index.dart';

part 'all_vendors_model.g.dart';

@JsonSerializable(createToJson: false)
class AllVendorModel extends BaseResponse<AllVendorEntity> {
  const AllVendorModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory AllVendorModel.fromJson(Map<String, dynamic> json) =>
      _$AllVendorModelFromJson(json);
}
